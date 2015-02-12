FROM ruby:2.2.0
MAINTAINER Seigo Uchida <spesnova@gmail.com> (@spesnova)

RUN apt-get update && \
    apt-get install -y \
      nodejs && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY .  /app

RUN bundle install && \
    bundle exec rake assets:precompile

EXPOSE 3000

CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]
