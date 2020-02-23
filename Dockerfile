FROM ruby:2.5.0

ENV LANG C.UTF-8

RUN apt-get update && apt-get install -y \
  build-essential \
  nodejs \
  graphviz \
  vim

# Node.js
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - && \
  apt-get install -y nodejs

# Yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
  apt-get update && \
  apt-get install -y yarn

ENV EDITOR /usr/bin/vim

WORKDIR /myapp

# Rubygems
RUN gem update --system
COPY Gemfile Gemfile.lock /myapp/
RUN bundle install -j 4

# Run server
COPY . /myapp/
CMD ["docker/bin/start-rails"]