FROM ruby:2.2.0
MAINTAINER Seigo Uchida <spesnova@gmail.com> (@spesnova)

RUN apt-get update && \
    apt-get install -y \
      nodejs=0.10.29~dfsg-1.1 && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY .  /app

RUN bundle install --path vendor/bundle -j4 && \
    bundle exec rake assets:precompile

EXPOSE 3000

CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]
