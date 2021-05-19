# WEKA Docker
This project is aim to automatically install and setup [WEKA](https://www.cs.waikato.ac.nz/ml/weka/) in docker envrionment. 

## Components
- WEKA 3.8.5
- wekaDeeplearning4j
- HSQLDB

WEKA can run in container with some constraints:
- Only hsqldb can be use for experiment (if the database is needed) as the jdbc can only be configured for one particular database engine at same time. (hsqldb will run with WEKA together.)
- GPU passthrough is not supported yet

## Pre-installation
Befare starting weka, please make sure you have already setup the X11 configuration for GUI app in docker.
### Linux
Expose xhost so that the Docker container can display GUI.
```
$ xhost +local:root
```
The file install.sh have already included this command when the installation is finished. However, this setting is no long availble after the system is restarted. So please run it before you start WEKA in docker when the system has just started.

### MacOS
Please setup up X window server according to [this article](https://cntnr.io/running-guis-with-docker-on-mac-os-x-a14df6a76efc) first.

### Windows
Please follow the "[For windows 10](https://moa.cms.waikato.ac.nz/how-to-use-moa-in-docker)" section.

## Install
If you have already installed docker and docker-compose, just run
```
$ docker-compose build
```
for building weka image, and
```
$ docker-compose up
```
for starting weka.

If you have not had docker installed or want to re-install docker with the latest version, run
```
$ bash install.sh
```
for Ubuntu, or
```
install.ps1
```
for windows for a fresh start.



