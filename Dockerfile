FROM node:latest

MAINTAINER Venelin Iliev "venelin@provision.bg"

# Chrome signing
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | tee /etc/apt/sources.list.d/google-chrome.list

# Install packages
RUN apt-get update -yqqq && \
    apt-get install -y google-chrome-stable xvfb firefox-esr rsync

# Install Selenium / webdriver-manager & update
RUN npm install -g webdriver-manager && \
    webdriver-manager update

# Run xvfb
RUN Xvfb :99 -ac &
RUN export DISPLAY=:99

# Cleaning...
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/*

# Versions
RUN echo 'PACKAGE VERSIONS:' && \
    echo '-- node version:' && \
    node -v && \
    echo '-- npm version:' && \
    npm -v && \
    echo '-- google chrome version:' && \
    google-chrome --version && \
    echo '-- firefox version:' && \
    firefox --version && \
    echo '-- selenium/webdriver-manager version:' && \
    webdriver-manager version  && \
    webdriver-manager status
