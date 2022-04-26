# Overview
This is a build environment using Docker for the Veraison project (https://github.com/veraison/veraison).

# Instructions
To build the Docker container:
```
make build
```

To run the Docker container:
```
make run
```

To enter a `bash` shell in the running Docker container:
```
make exec
```

Then follow the directions to build Veraison while inside that bash shell.

# Notes

Note that `make run` presumes that the Veraison source code is in the path `../veraison` relative to the `veracruz_docker` folder. If this is not the case, it should be run as follows:
```
make run -D VERAISON_HOME=<PATH TO THE VERAISON SOURCE CODE FOLDER>
```

Note that `make build` will check the user environment and create a user for the current UID in the Docker container. If you intend to create a Docker container for public use (for example for distribution on Docker Hub or for a CI system) this is likely not to be sufficient (as the CI system will probably not have the same UID as the current user, and users of Docker Hub will likely be in the same situation). In these situations, changes to this environment are required.

