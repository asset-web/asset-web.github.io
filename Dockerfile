FROM ruby:3.4.12

RUN apt-get update && apt-get install -y libcurl4-openssl-dev

RUN mkdir -p /src
COPY ./Gemfile /src
COPY ./Gemfile.lock /src
WORKDIR /src
RUN gem install bundler:4.0.10
RUN bundle config lockfile_checksums true
RUN bundle install

COPY . /src

VOLUME /src/_site

CMD ["bash", "/src/script/buildtest"]