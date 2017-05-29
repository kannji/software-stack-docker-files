############################################################
# Dockerfile to build the kannji redmine image
# Based on redmine
############################################################
FROM redmine
LABEL maintainer "Jan-Luca Klees"

# make redmine run under /redmine
# remove the default config.ru file and replace it with a one that has patched routing
RUN rm -v            /usr/src/redmine/config.ru
ADD ./data/config.ru /usr/src/redmine/config.ru

# remove the default environment file and use the one with patched routing.
RUN rm -v                 /usr/src/redmine/config/environment.rb
ADD ./data/environment.rb /usr/src/redmine/config/environment.rb