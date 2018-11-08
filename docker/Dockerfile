FROM ruby:2.5.3-stretch

RUN wget -q https://www.postgresql.org/media/keys/ACCC4CF8.asc -O - | apt-key add -
RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ stretch-pgdg main" >> /etc/apt/sources.list
RUN apt-get update -qq
RUN apt-get install -y build-essential libpq-dev nodejs postgresql-client-9.4

WORKDIR /falsecoach_server
