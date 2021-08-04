FROM debian:latest
FROM python:3.9.6-slim-buster
RUN apt update && apt upgrade -y
RUN apt install git curl python3-pip ffmpeg -y
RUN pip3 install -U pip
RUN curl -sL https://deb.nodesource.com/setup_16.x | bash -
RUN apt-get install -y nodejs
RUN npm i -g npm
RUN pip3 install -U youtube-dl
RUN pip3 install --upgrade youtube-dl
RUN tee /usr/local/bin/youtube-dl >/dev/null
RUN chmod a+x /usr/local/bin/youtube-dl
RUN cd /
RUN git clone https://github.com/OxyNotOp/OxyVCbot.git
RUN cd OxyVCbot
RUN mkdir /app/
WORKDIR /app/
COPY . /app/
RUN pip3 install -U -r requirements.txt
CMD python3 -m OxyXmusic
