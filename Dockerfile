FROM ruby:2.7.8
#  FROM ruby:3.2.3

RUN apt-get update && apt-get install -y libcurl4-openssl-dev

RUN mkdir -p /src
COPY ./Gemfile /src
COPY ./Gemfile.lock /src
WORKDIR /src
RUN gem install bundler:2.3.27
# RUN gem install bundler:2.5.5
# RUN git clone --branch v1.4 https://github.com/zerostaticthemes/jekyll-serif-theme.git
RUN bundle install

COPY . /src

CMD ["bash", "/src/script/buildtest"]