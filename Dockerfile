FROM ruby:3.0.2

RUN apt-get update && apt-get install -y libcurl4-openssl-dev

RUN mkdir -p /src
COPY ./Gemfile /src
COPY ./Gemfile.lock /src
WORKDIR /src
RUN bundle install

COPY . /src

CMD ["bash", "/src/script/buildtest"]