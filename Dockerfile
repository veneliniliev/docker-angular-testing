FROM node:latest

MAINTAINER Venelin Iliev "venelin@provision.bg"

RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | tee /etc/apt/sources.list.d/google-chrome.list

RUN apt-get update -yqqq && \
    apt-get install -y google-chrome-stable xvfb

RUN Xvfb :99 -ac &
RUN export DISPLAY=:99

RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/*
