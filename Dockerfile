FROM ruby:2.5.1
RUN apt-get update && apt-get install  -y 
RUN mkdir /app
WORKDIR /app
COPY Gemfile Gemfile.lock ./

RUN gem install bundler -v 2.1.4
RUN gem update --system
ENV BUNDLER_VERSION=2.1.4
RUN bundle install

RUN apt-get install apt-transport-https ca-certificates
RUN curl -sL https://deb.nodesource.com/setup_lts.x | bash -
RUN apt-get install -y nodejs
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt update -y && apt install -y yarn


COPY . ./
RUN bundle exec rails db:migrate
#RUN bundle exec rails webpacker:install
# RUN gem install bundler && bundle install --jobs 20 --retry 5

ENV TZ="America/Mexico_City"

# EXPOSE 3000
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
