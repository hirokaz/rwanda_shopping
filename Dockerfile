FROM ruby:2.7.7

ENV LANG=C.UTF-8
ENV TZ=Asia/Tokyo
ENV RAILS_ENV=production


RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update -yqq && apt-get install -yqq --no-install-recommends \
  nodejs \
  postgresql-client \
  vim \
  yarn \
  imagemagick 

WORKDIR /myapp

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .
RUN npm rebuild node-sass #maybe you don't need it, I do
RUN bundle exec rails assets:precompile

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]
