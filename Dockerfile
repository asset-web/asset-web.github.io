FROM ruby:3.2.6

RUN apt-get update && apt-get install -y libcurl4-openssl-dev

RUN mkdir -p /src
COPY ./Gemfile /src
COPY ./Gemfile.lock /src
WORKDIR /src
RUN gem install bundler:2.5.23
RUN bundle install

COPY . /src

CMD ["bash", "/src/script/buildtest"]