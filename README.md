# SILDa: Scape-Imperial Localisation Dataset

This is the public release of the Scape-Imperial Localisation Dataset
(*SILDa*).

> *Please Note*. This is work in progress, and we are currently adding
> examples, and updating the documentation. If details for a specific
> SILDa task are not here yet, please check again soon.

## Getting the data
We provide a bash script `download.sh` to download all the available data for SILDa.
To execute, simply open a terminal and type `sh download.sh`. Please note that the download
will take some time due to the amount of data (approx. 60GB).

## Local Patches
For the *local patches task*, we provide a set of `557166` interest
points, each consisting 7 patches. This leads to a total of `3900162`
individual patches. Note that the patches are saved in their full
color format, to enable experiments with colour descriptors.
Descriptors extracted from RGB patches have not been extensively
explored in the deep learning literature, possibly due to the fact
that no large scale colour patches dataset is widely available.

To submit your method's results to the local patches task, please check the
[silda-patches notebook](silda-local-patches.ipynb) where all the required
steps are described in detail.

Results will be based on patch retrieval accuracy, using a method
similar to the [HPatches retrieval protocol](http://hpatches.github.io).

## Image Matching
For the *image matching task*, we provide a set of `335k` pairs of images.

To submit your method's results to the image matching task, please
check the [silda-matching notebook](silda-image-matching.ipynb) where all the
required steps are described in detail.

Results will be based on computing matching accuracy, using epipolar geometry.

## Camera Pose Estimation
For the *camera pose estimation task*, we provide a set of `6064`
query images for which the camera pose is not known. We also provide
`8344` images with known poses as a training set. The users can
utilise any method they want, to produce full 6DoF camera poses for
the unknown queries.

To submit your method's results to the camera pose estimation task,
please check the [silda-camera-poses notebook](silda-camera-poses.ipynb) where
all the required steps are described in detail.

Results will be based on camera pose accuracy, i.e. measuring
translation and rotation errors between the prediction and the ground
truth. For more information on this task, please see
[www.visuallocalization.net](https://www.visuallocalization.net/)

## Building Recognition
For the *building recognition task*, we provide a set of `6064` query
images for which the observed buildings are not known. We also provide
`8344` images together with the labels of the observed buildings. We
provide a total of 25 buildings, and we provide on average 300 images
per building as training set. This can be though as a *few shot
learning* task. The users can utilise any relevant method, to produce
building labels for the query images.

To submit your method's results to the camera pose estimation task,
please check the [silda-building-recognition notebook](silda-building-recognition.ipynb) where all the required steps are
described in detail.

Results will be based on standard multi-class classification mAP
measurements, for the building recognition task.

## Aerial2Ground

More details for this task will be available soon.

## Image Retrieval

More details for this task will be available soon.

## CVPR 2019 Workshops

The patches, matching and 6DoF tasks are parts of challenges
associated with 2 CVPR 2019 workshops. For more information, please
refer to the individual websites below.

[CVPR 2019 Workshop on Image Matching](https://image-matching-workshop.github.io)

[CVPR 2019 Workshop on Long-Term Visual Localization under Changing Conditions](https://sites.google.com/view/ltvl2019)


## License
The images of *SILDa* are licensed under a
[Creative Commons Attribution-NonCommercial-ShareAlike 4.0
International
License](https://creativecommons.org/licenses/by-nc-sa/4.0/) and are
intended for non-commercial academic use only.

We are not currently planning to make the dataset available for commercial use.

### Using SILDa
By using SILDa, you agree to the license terms set out above.

### Privacy
We take privacy very seriously. For this reason, we used software to
automatically blur faces and licence plates, and in addition we
verified the results manually. If you have any concerns regarding the
images and other data provided with this dataset, or find faces or
licence plates that we have missed, please [contact
us](mailto:research@scape.io).
