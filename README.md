# tf-base-notebook

This is a container image intended to make it easy to run Jupyter notebooks with Tensorflow on OpenShift. 

## Build

`docker build -t submod/tf-base-notebook .`

## Usage

### As a standalone image

`docker run -p -t 8888:8888 -p 6006:6006 submod/tf-base-notebook `

For your convenience, binary image builds are available from Docker Hub.

* Add the image `submod/tf-base-notebook` to an OpenShift project
* Set `JUPYTER_NOTEBOOK_PASSWORD` in the pod environment to something you can remember (this step is optional but highly recommended; if you don't do this, you'll need to trawl the logs for an access token for your new notebook)
* Create a route to the pod

### As a base image

* As `nbuser` (uid 1011), add notebooks to `/workspace`.

## Credits

This image was based on [base-notebook](https://github.com/radanalyticsio/base-notebook).
