FROM ruby:2.3.8-jessie

RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ jessie-pgdg main" | tee /etc/apt/sources.list.d/pgdg.list

RUN wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -

RUN apt-get update -yqq \
  && apt-get install -yqq --no-install-recommends \
    build-essential \
    postgresql-client-9.6 \
    nodejs \
    vim \
    libpq-dev \
    qt5-default \
    libqt5webkit5-dev \
  && apt-get -q clean
RUN apt-get update

WORKDIR /usr/src/app

COPY Gemfile Gemfile.lock ./

RUN gem install bundler -v=1.17.3

RUN bundle install

COPY . .
