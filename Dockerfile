FROM ruby:2.7.7

ENV LANG=C.UTF-8
ENV TZ=Asia/Tokyo

RUN apt-get update -yqq && curl -sL https://deb.nodesource.com/setup_16.x | bash -
#必要なライブラリを作成している
RUN apt-get install -yqq --no-install-recommends \
  nodejs \
  postgresql-client \
  vim \
  yarn \
  imagemagick 
  
RUN apt-get install vim

RUN mkdir /myapp
WORKDIR /myapp
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
RUN curl -sL https://deb.nodesource.com/setup_12.x  | bash -
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update -qq && apt-get install -y nodejs yarn


RUN bundle install
COPY . /myapp
RUN npm rebuild node-sass #maybe you don't need it, I do
RUN bundle exec rails assets:precompile

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]
