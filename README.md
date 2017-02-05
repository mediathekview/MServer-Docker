# MServer-Cloud
A repository withe source code of the docker container which will be used to run mserver in the aws.

## How to start

1. Create two S3 buckets
   - One for the MServer configs
   - One for the MServer output
2. Change the run.sh for your needs
   - Fill the variables
3. Build the docker file
4. Run the run.sh

If you want to run in ECS you just have to build and upload the container to your ECS repo. Then you can run it as a task.
