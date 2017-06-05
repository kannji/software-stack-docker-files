############################################################
# Dockerfile to build the kannji redmine image
# Based on redmine
############################################################
FROM ruby:2.3
LABEL maintainer "Jan-Luca Klees"

# add our user and group first to make sure their IDs get assigned consistently, regardless of whatever dependencies get added
RUN groupadd -r redmine && useradd -r -g redmine redmine

# every thing fresh
RUN apt-get -y update
RUN apt-get -y upgrade

# packages
RUN apt-get -y install imagemagick

# gems
RUN gem install bundler puma

ENV RAILS_ENV production

WORKDIR /usr/src/redmine

#  download and extract redmine
ENV REDMINE_VERSION 3.3.3
ENV REDMINE_DOWNLOAD_MD5 c946839c9a51dba48ae7c34c5351f677
ADD https://www.redmine.org/releases/redmine-${REDMINE_VERSION}.tar.gz redmine.tar.gz
RUN echo "$REDMINE_DOWNLOAD_MD5 redmine.tar.gz" | md5sum -c -
RUN tar -xvf redmine.tar.gz --strip-components=1
RUN rm redmine.tar.gz files/delete.me log/delete.me

RUN mkdir -p tmp/pdf public/plugin_assets
RUN chown -R redmine:redmine files log tmp public/plugin_assets
RUN chmod -R 755 files log tmp public/plugin_assets

# make redmine run under www.host.tld/redmine
# remove the default config.ru file and replace it with a one that has patched routing
RUN rm -v            config.ru
ADD ./data/config.ru config.ru

# remove the default environment file and use the one with patched routing.
RUN rm -v                        config/environment.rb
ADD ./data/config/environment.rb config/environment.rb

# db config
ADD ./data/config/database.yml   config/database.yml

RUN bundle install --without development test

VOLUME /usr/src/redmine/files

EXPOSE 3000

# entrypoint
ADD entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]

CMD ["bundle", "exec", "rails", "s", "puma", "-b", "0.0.0.0"]