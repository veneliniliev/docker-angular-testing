FROM node:latest

RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
     echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | tee /etc/apt/sources.list.d/google-chrome.list \
     apt-get update -yqqq \
     apt-get install -y google-chrome-stable xvfb \
     Xvfb :99 -ac & \
     export DISPLAY=:99
