[![Docker build](https://img.shields.io/docker/automated/radanalyticsio/tf-base-notebook.svg)](https://hub.docker.com/r/radanalyticsio/tf-base-notebook)
[![Layers info](https://images.microbadger.com/badges/image/radanalyticsio/tf-base-notebook.svg)](https://microbadger.com/images/radanalyticsio/tf-base-notebook)

# tf-base-notebook

This is a container image intended to make it easy to run Jupyter notebooks with Tensorflow on OpenShift. 

## Build

`docker build -t radanalyticsio/tf-base-notebook .`

## Usage

### In openshift

create a project
```
oc new-project test
```

create the template 
```
oc create -f \
https://raw.githubusercontent.com/radanalyticsio/tf-base-notebook/master/template.json
```
To create with tf notebook pod for CPU :
```
oc new-app --template jupyterapp 
```

or

```
oc new-app submod/tf-base-notebook -e JUPYTER_NOTEBOOK_PASSWORD=password

```
### As a standalone image

`docker run -t -p 8888:8888 -p 6006:6006 radanalyticsio/tf-base-notebook `

For your convenience, binary image builds are available from Docker Hub.

* Add the image `radanalyticsio/tf-base-notebook` to an OpenShift project. 
```oc new-app radanalyticsio/tf-base-notebook ```
* Set `JUPYTER_NOTEBOOK_PASSWORD` in the pod environment to something you can remember (this step is optional but highly recommended; if you don't do this, you'll need to trawl the logs for an access token for your new notebook)
* Create a route to the pod

### As a base image

* As `nbuser` (uid 1011), add notebooks to `/workspace`.

