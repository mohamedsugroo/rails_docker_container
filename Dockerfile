FROM ruby:2.6.5
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
# Set an environment variable where the Rails app is installed to inside of Docker image
ENV RAILS_ROOT /app
RUN gem install bundler
RUN gem install puma

RUN mkdir -p $RAILS_ROOT
# Set working directory
WORKDIR $RAILS_ROOT

COPY . .

RUN bundle install --jobs 20 --retry 5 --without development test

EXPOSE 3000
