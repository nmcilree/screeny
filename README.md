# Screeny

Simple docker container to take screen grab from website for greenminds project.

**Requirements:**
- Public facing server that support Docker

**Example installation on Amazon EC2 instance**
- Install Docker
- clone/copy git code into folder
- build docker image by running following command from root of folder `docker build -t <your-tag-name> --no-cache .` 
- run the docker container using following command ( setting it to forward port 80 on your host to port 80 in the container ) `docker run -t -d -p 80:80 screeny
- Check it's running `docker ps` - this should show the running process
