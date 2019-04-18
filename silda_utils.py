"""
SILDa: Scape-Imperial Localisation Dataset

We provide tools to convert pixel positions in the spherical
images to directions of rays. Please refer to the individual
documentation of the methods.

For more information please check
https://research.scape.io
https://github.com/scape-research/silda
"""

import numpy as np


class dotteddict(dict):
    """Gets dict items with the dot notation"""
    __getattr__ = dict.get


class SildaLens:
    """Loads the lens parameters from a SILDa .intrinsics file"""

    def __init__(self, filename):
        intrinsics = np.loadtxt(filename)
        lens_intrinsics = {}
        lens_intrinsics['principal_point'] = dotteddict({
            'x': intrinsics[1],
            'y': intrinsics[0]
        })
        lens_intrinsics['coefficients'] = intrinsics[2:]
        self.intrinsics = dotteddict(lens_intrinsics)


def spherical_coordinates_to_spherical_rays(pixels, lens, image_size=1024):
    """
    Convert pixel positions in spherical images to spherical rays.
    Returns a numpy array of points the 3-dimensional unit sphere.
    The ray directions are given from the vector connecting (0,0,0) to points.
    """
    # All intrinsics are computed for the original image size below
    ORIG_IMAGE_SIZE = 2496
    scale_factor = image_size / ORIG_IMAGE_SIZE
    pixels = pixels / scale_factor
    pixels[0, :] = pixels[
        0, :] - lens.intrinsics.principal_point.y * ORIG_IMAGE_SIZE
    pixels[1, :] = pixels[
        1, :] - lens.intrinsics.principal_point.x * ORIG_IMAGE_SIZE

    distance = np.sqrt(np.square(pixels[0, :]) + np.square(pixels[1, :]))
    coeffs = [
        coeff / float(ORIG_IMAGE_SIZE**idx)
        for idx, coeff in enumerate(lens.intrinsics.coefficients)
    ]
    z = np.zeros(shape=(pixels.shape[1], len(coeffs)), dtype="float")
    for k in range(len(coeffs)):
        z[:, k] = np.power(distance, k)

    z = np.dot(z, np.asmatrix(coeffs).T)
    points = np.ones(shape=(3, pixels.shape[1]), dtype="float")

    points[0, :] = pixels[1, :]
    points[1, :] = pixels[0, :]
    points[2, :] = np.squeeze(z)

    mag = np.sqrt(
        np.square(points[0, :]) + np.square(points[1, :]) +
        np.square(points[2, :]))
    points[0, :] = points[0, :] / mag[:]
    points[1, :] = points[1, :] / mag[:]
    points[2, :] = points[2, :] / mag[:]

    return points
