FROM ruby:2.7.7

ENV LANG=C.UTF-8
ENV TZ=Asia/Tokyo

RUN apt-get update -yqq && curl -sL https://deb.nodesource.com/setup_16.x | bash -
RUN apt-get install -yqq --no-install-recommends \
  nodejs \
  postgresql-client \
  vim \
  yarn \
RUN apt-get install vim

RUN mkdir /myapp
WORKDIR /myapp
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock

RUN bundle install
COPY . /myapp


# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]
