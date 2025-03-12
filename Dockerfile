FROM ruby:3.4

WORKDIR /src/app

COPY Gemfile Gemfile.lock ./

RUN bundle config --global frozen 1

COPY . .

RUN bundle install

# RUN bundle exec rake db:create

ENV PORT=4567

EXPOSE 4567

CMD ["ruby", "./app.rb"]