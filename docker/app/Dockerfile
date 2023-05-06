FROM ruby:2.7.7

RUN apt-get update -qq && apt-get install -y nodejs build-essential

ENV RAILS_ROOT /var/www/jailgas
RUN mkdir -p $RAILS_ROOT

WORKDIR $RAILS_ROOT 

ENV RAILS_ENV='production'
ENV RACK_ENV='production'

COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
RUN bundle install --without test 


COPY . .

EXPOSE 3000
CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]

