FROM ruby:2.6.5
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs cron
# Set an environment variable where the Rails app is installed to inside of Docker image
ENV RAILS_ROOT /api
ENV SECRET_KEY_BASE dfd6dcf014bc92d8476bb04364e93c900b3742c5e2b8763b6d45fb2b6cc3030e02f292d2de49faa5dc2b805167b8b1aee909e890fc907c8edae9417f91afabe8
RUN gem install bundler
RUN gem install puma

# CRON JOBS
COPY crontab /etc/cron.d/hello-cron
RUN chmod 0644 /etc/cron.d/hello-cron
CMD cron && tail -f /var/log/cron.log

RUN touch /var/log/cron.log
# Ruby app
RUN mkdir -p $RAILS_ROOT
# Set working directory
WORKDIR $RAILS_ROOT

COPY . .

RUN bundle install
RUN bundle lock --add-platform x86-mingw32 x86-mswin32 x64-mingw32 java
# --jobs 20 --retry 5 --without development test

RUN bundle exec whenever --update-crontab



EXPOSE 3000
