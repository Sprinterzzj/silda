# SILDa: Scape-Imperial Localisation Dataset

This is the public release of the Scape-Imperial Localisation Dataset
(*SILDa*).

## Getting the data

We provide a bash script `download.sh` to download all the available data for SILDa.
To execute, simply open a terminal and type `sh download.sh`. Please note that the download
will take some time due to the amount of data (approx. 60GB).

## Local Patches
For the *local patches task*, we provide a set of `557166` interest
points, each consisting 7 patches.  This leads to a total of `3900162`
individual patches. Note that the patches are saved in their full
color format, to enable experiments with colour descriptors.
Descriptors extracted from RGB patches have not been extensively
explored in the deep learning literature, possibly due to the fact
that no large scale colour patches dataset is widely available.

To submit your method to the local patches task, please check the
[silda-patches notebook](silda-patches.ipynb) where all the required
steps are described in detail.


## CVPR 2019 Workshops

[CVPR 2019 Workshop on Long-Term Visual Localization under Changing Conditions]
(https://sites.google.com/view/ltvl2019)

[CVPR 2019 Workshop on Image Matching]
(https://image-matching-workshop.github.io)



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
We take privacy seriously. For this reason, we used software to
automatically blur faces and licence plates, and in addition we
verified the results manually. If you have any concerns regarding the
images and other data provided with this dataset, or find faces or
licence plates that we have missed, please [contact
us](mailto:research@scape.io).
