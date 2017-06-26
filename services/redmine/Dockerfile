############################################################
# Dockerfile to build the kannji redmine image
# Based on redmine
############################################################
FROM redmine
LABEL maintainer "Jan-Luca Klees"

# every thing fresh
RUN apt-get -y update
RUN apt-get -y upgrade

# some zip tool for extracting the code from the repo
RUN apt-get -y install unzip

# make redmine run under www.host.tld/redmine
# remove the default config.ru file and replace it with a one that has patched routing
RUN rm -v            /usr/src/redmine/config.ru
ADD ./data/config.ru /usr/src/redmine/config.ru

# remove the default environment file and use the one with patched routing.
RUN rm -v                 /usr/src/redmine/config/environment.rb
ADD ./data/environment.rb /usr/src/redmine/config/environment.rb

# install plugins

# theme changer
ADD https://bitbucket.org/haru_iida/redmine_theme_changer/downloads/redmine_theme_changer-0.2.0.zip /usr/src/redmine/plugins-dl/redmine_theme_changer.zip
RUN unzip /usr/src/redmine/plugins-dl/redmine_theme_changer.zip -d /usr/src/redmine/plugins/

# cleanup
RUN rm -rf /usr/src/redmine/plugins-dl/

# install themes

# pixel-coockers
ADD https://github.com/pixel-cookers/redmine-theme/zipball/master /usr/src/redmine/themes-dl/pixel-cookers-redmine-theme.zip
RUN unzip /usr/src/redmine/themes-dl/pixel-cookers-redmine-theme.zip -d /usr/src/redmine/public/themes/

# cleanup
RUN rm -rf /usr/src/redmine/themes-dl/