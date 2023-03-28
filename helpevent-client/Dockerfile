FROM node:18.13.0

ENV PORT 3000

EXPOSE 3000

WORKDIR /var/www/html

COPY start-client.sh $APP_HOME
COPY package.json $APP_HOME
COPY package-lock.json $APP_HOME

RUN npm config delete proxy
RUN npm i

ADD . $APP_HOME