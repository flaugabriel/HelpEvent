FROM ruby:3.2.1

ENV PORT 3030
EXPOSE 3030
ENV APP_HOME /helpevent-api

RUN apt-get update -qq

RUN mkdir $APP_HOME
WORKDIR $APP_HOME

ADD Gemfile $APP_HOME/Gemfile
ADD Gemfile.lock $APP_HOME/Gemfile.lock

COPY lib/ $APP_HOME/vendor/

ADD Gemfile* $APP_HOME/

ADD . $APP_HOME
