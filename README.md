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

For running powershell script, you have to make sure the excution policy is allowed to do so. A simple way to set the policy is to run:
```
$ PS1:> Set-ExecutionPolicy Unrestrict
```
in PowerShell(Admin).

## Install
If you have already installed docker and docker-compose, just run
```
$ docker-compose build
```
for building weka image.

If you have not had docker installed or want to re-install docker with the latest version, run
```
$ bash install.sh
```
for Ubuntu, or
```
PS> .\install.ps1
```
for windows for a fresh install. 

For windows users, when the installation is finished please logout and re-login (or just reboot) to make sure the docker engine is properly started.

## Startup
### Linux
```
$ ./startup.sh
```

### Windows
```
PS> .\startup.ps1
```

## Environment Variables
### DISPLAY
For using GUI on the host, we need to bind X windows server while running WEKA. The variable DISPLAY stores the address to connect the X system. Nomally, there is no need to set it manually. Our startup script will take care of it.

### WEKA_JAVA_OPTS
If you want to pass some settings to the JVM when starting WEKA, please put those options in this varble befare starting WEKA.

## Volumns
WEKA container uses three volumns for passing host folders through the container. Those three path on host are controlled by environment varables. If the varables are not set, the current work directory will be mount to the container.

### WEKA_DATA_DIR
WEKA_DATA_DIR is aimed to pass training data to the container.
### WEKA_RESULT_DIR
WEKA_RESULT_DIR is used to store training result on host.

### WEKA_JAR_DIR
WEKA_JAR_DIR is for extending WEKA by storing jar packages. All the packages in this folder will be included in the classpath of JVM.