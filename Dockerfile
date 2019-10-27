FROM ruby:2.6.5

RUN apt-get update -qq && apt-get install -y build-essential fortune

ENV APP_HOME /app
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

ADD Gemfile* $APP_HOME/
RUN bundle install --without development test

ADD . $APP_HOME

CMD ["ruby", "./api-client.rb"]