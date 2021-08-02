# Screeny

Simple docker container to take screen grab from website for greenminds project. It works in the following manner
- Docker container runs a cron job every 20 mins
- Using Python Selenium library and headless firefox/geckdriver scrape.py captures a given URL
- Resultant png is converted to bmp and saved to /var/www/html
- As Docker container is running standard apache2 install this image (screengrab.bmp) is now available from the root of the container host i.e http://35.176.129.138/screengrab.bmp 

**Requirements:**
- Public facing server that support Docker

**Example installation on Amazon EC2 instance**
- Install Docker
- clone/copy git code into folder
- build docker image by running following command from root of folder `docker build -t <your-tag-name> --no-cache .` 
- run the docker container using following command ( setting it to forward port 80 on your host to port 80 in the container ) docker run -t -d -p 80:80 <your-tag-name>
- Check it's running `docker ps` - this should show the running process
- browser to host URL/IP to download latest screengrab ( be mindful of your browser caching - perhaps adding a random querystring to the request might help )

**Manually running scrape**
You can execute into the running docker container and manually run the scape
- `docker exec -it <name-of-container> bash` ( you can get the name by running `docker ps` )
- run `python scrape.py` to manually run


**Example installation on ionos Ubuntu**
- Install Docker (https://docs.docker.com/engine/install/ubuntu/)
- Install git 'apt-get install git'
- clone/copy git code into folder
- build docker image by running following command from root of folder `docker build -t <your-tag-name> --no-cache .` 
- run the docker container using following command ( setting it to forward port 7000 on your host to port 80 in the container ) docker run -t -d -p 7000:80 <your-tag-name>
- Check it's running `docker ps` - this should show the running process ( and show you the name of the container )
- Update firewall rule to allow access over 7000
- browser to host URL/IP:7000/screengrab.bmp to download latest screengrab ( be mindful of your browser caching - perhaps adding a random querystring to the request might help )

**Manually running scrape**
You can execute into the running docker container and manually run the scape
- `docker exec -it <name-of-container> bash` ( you can get the name by running `docker ps` )
- run `python scrape.py` to manually run
