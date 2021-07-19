FROM python:3.7

RUN apt-get update
RUN apt-get install -y libpq-dev zip
RUN apt-get install gcc -y
RUN apt-get install wget -y
RUN apt-get install iceweasel -y
RUN wget https://github.com/mozilla/geckodriver/releases/download/v0.29.1/geckodriver-v0.29.1-linux64.tar.gz
RUN tar -xzf geckodriver-v0.29.1-linux64.tar.gz
RUN apt-get -y install cron
RUN apt-get install -y cron
RUN apt-get update && apt-get install -y cron
RUN touch /var/log/cron.log

COPY . /greenminds
VOLUME /greenminds
WORKDIR /greenminds
RUN pip install -r /greenminds/requirements.txt


# Create the log file to be able to run tail
RUN touch /var/log/cron.log

# Setup cron job
#RUN (crontab -l ; echo "* * * * * echo "Hello world" >> /var/log/cron.log") | crontab
#RUN (crontab -l ; echo "* * * * * /usr/local/bin/python /greenminds/scrape.py" ) | crontab
#RUN (crontab -l ; echo "* * * * * /usr/bin/sh /greenminds/scrape.sh" ) | crontab
#RUN (crontab -l ; echo "* * * * * python /greenminds/scrape.py") | crontab
#RUN (crontab -l ; echo "* * * * * /usr/local/bin/python /greenminds/scrape.py >> /greenminds/boom.txt 2>&1" ) | crontab 
RUN (crontab -l ; echo "*/30 * * * * /usr/local/bin/python /greenminds/scrape.py >> /greenminds/boom.txt 2>&1" ) | crontab 

# Run the command on container startup
CMD cron && tail -f /var/log/cron.log

#COPY crontab /etc/cron.d/crontab
#RUN chmod 0644 /etc/cron.d/crontab
#RUN /usr/bin/crontab /etc/cron.d/crontab
#RUN chmod 0744 /greenminds/scrape.py
#RUN crontab /etc/cron.d/crontab
#CMD ["cron", "-f"]
#CMD cron -f