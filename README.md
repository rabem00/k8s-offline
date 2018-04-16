# k8s-offline
Some script that will pull k8s version 1.9.6 for offline use.

## pull-images.sh
This script will pull images and tar them to directory images. After this the images are removed from docker.
The directory images that need to be saved to external repo (dropbox, cloud, etc).

## load-images.sh
The script load-images will load the images in docker on the offline server. It will need
the images from the external repo (how they get there is up to the user, for instance usb-key).

 
