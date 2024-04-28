## Overview 
This merge request aims to enhance the usability and standardization of the rcssserver by introducing the automatic build and release of its latest AppImage and DockerImage versions on GitHub. This will simplify the process for RoboCup users to download and run the rcssserver, while also providing an official version to standardize tournament runs on Docker.

## AppImage Release Details
https://github.com/rcsoccersim/rcssserver/assets/23504332/13e02c5f-b671-4ef0-8d1f-23a99a00884e

This merge request includes the following files for the automatic AppImage release:

* `.github/workflows/main.yml ` : This is the GitHub action pipeline designed to build the AppImage and publish the release.
* `utils/appimage/*`: This directory contains all files related to the AppImage building, including:
 ```
utils/appimage
├── build_appimage.sh -> Bash script for building the AppImage.
├── build_code.sh -> Bash script for building the code.
├── Dockerfile.builder-1804 -> Docker image for building the AppImage, based on Ubuntu 18.04.
├── Dockerfile.builder-2004 -> Docker image for building the AppImage, based on Ubuntu 20.04.
├── Dockerfile.builder-2404 -> Docker image for building the AppImage, based on Ubuntu 24.04.
├── rcssmonitor.desktop -> Desktop file of rcssserver.
└── rcssmonitor.png -> Image of rcssmonitor.
```

## Docker Release Details

This merge request also includes the following files for the automatic Docker release:

* `.github/workflows/main.yml ` : This is the GitHub action pipeline designed to build the Docker image and publish the release.
* `utils/docker/*`: This directory contains all files related to the Docker image building, including:
 ```
utils/docker
├── docker-entrypoint.sh -> Main script that runs when the rcssserver Docker image is executed.
├── Dockerfile -> Blueprint for building the Docker image of rcssserver.
└── README.md -> Readme file to be published along with the release on the Docker Hub website.
```

## Release Pipeline Usage

The automatic pipeline will skip creating a release if the release name already exists in the GitHub releases. To create a new release:

* Update the application version in the `CMakeLists.txt` file.
* Push your changes, which will trigger the release creation.

You can use the AppImage after each push to the registry to verify the correctness of your proposed changes.

> keep in mind the realse pipline for the docker image is only work on the master branch but the appimage pipeline is working on all branches.

## Prerequisites for Pipeline Functionality

* An official DockerHub account is needed for pushing our Docker file.
* The following secrets need to be added to the GitHub project secrets:
   - `DOCKERHUB_USERNAME ` -> Docker Hub username.
   - `DOCKERHUB_TOKEN` -> Token from Docker Hub.
* `BASE_IMAGE` inside the `.github/workflows` should be updated to the DockerHub project path of the new image.

## Manual Docker Image Build Instructions
1. Clone the project and navigate to the project directory.
2. Run the following command to build the Docker image:

```bash
docker build -f utils/docker/Dockerfile -t rcssserver:latest .
# You can replace `rcssserver:latest` with your preferred image name.
# For example, to publish it on my own Docker Hub, I can change it to `sadraiiali/rcssserver:latest`.
```
3. After building the image, you can publish it to Docker Hub using the following commands:

```bash
# First, login to Docker Hub.
docker login
# Then, push the image to Docker Hub.
docker push sadraiiali/rcssserver:latest
```
4. If you want to run the Docker image, use the following command:

```bash
docker run -it --rm --network host rcssserver:latest
```

## Manual AppImage Build Instructions
1. Clone the project and navigate to the project directory.
2. Run the following command to build the code:

```bash
bash utils/appimage/build_code.sh
```
3. Run the following command to build the AppImage:

```bash
bash utils/appimage/build_appimage.sh
```
4. The AppImage will be created in the `build` folder.

## Additional Resources 
* linuxdeploy/linuxdeploy - [[LINK]](https://github.com/linuxdeploy/linuxdeploy)
* ncipollo/release-action - [[LINK]](https://github.com/ncipollo/release-action)
* What is AppImage? [[LINK]](https://docs.appimage.org/)
* What is Docker? [[LINK]](https://docs.docker.com/get-started/overview/)
* AppImage Example (POC) [[LINK]](https://github.com/sadraiiali/rcssmonitor-appimage/releases)
* Docker Image Example (POC) [[LINK]](https://hub.docker.com/r/sadraiiali/rcssserver)