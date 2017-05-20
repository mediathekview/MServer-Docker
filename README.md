# MServer-Docker
A repository with scripts and Dockerfils for the Mserver-Dockercontainer.

## MServer-Docker
The default MServer-Dockercontainer to run MServer in Docker.

### Environment variables for building the Dockercontainer

- `VERSION` The MServer version. This has to be same version format like the MServer tag. Example for MServer 3.1.1 this var has to be `3.1.1`

- `BIN_PATH` The internal path where the binarys should be saved to.
- - Default value: `/mserver`

- `CONFIGS_FOLDER_PATH` The internal path where the configuration files could be found. If the directory is empty the default configuration files will be moved to it.
- - Default value: `/conf`

- ` RESULTS_FOLDER_PATH` The internal path where the result files will be saved to.
- - Default value: `/res`

### How to run

Example for run the latest MServer:
```
docker run -d --name=mserver --restart always \
 -v /srv/mserver/data:/res \
 -v /srv/mserver/conf:/conf \
 mediathekview/mserver-docker:latest
```

## MServer Development Docker
A dockercontainer for the latest unstable MServer

### Environment variables

- `BRANCH` The branch for the MServer project
- `MLIB_BRANCH` The branch for the MLib project.

### How to run

Example for run the latest unstable MServer:
```
docker run -d --name=mserver-dev --restart always \
 -v /srv/mserver/data:/res \
 -v /srv/mserver/conf:/conf \
 -e"BRANCH=develop" \
 -e"MLIB_BRANCH=develop" \
 mediathekview/mserver-development-docker:latest
```

## MServer-Cloud
MServer-Dockercontainer optimized to run in AWS.

### How to start

1. Create two S3 buckets
   - One for the MServer configs
   - One for the MServer output
2. Change the run.sh for your needs
   - Fill the variables
3. Build the docker file
4. Run the run.sh

If you want to run in ECS you just have to build and upload the container to your ECS repo. Then you can run it as a task.

