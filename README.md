# Tessa Alexander-Holmes - asset-web.co.uk

Migrating static one homepage to Jekyll site to be hosted on GitHub pages and deployed using Travis CI.

[![Build and test status](https://github.com/asset-web/asset-web.github.io/actions/workflows/docker.yml/badge.svg)](https://github.com/asset-web/asset-web.github.io/actions/workflows/docker.yml)
[![GitHub pages backup deployment](https://github.com/asset-web/asset-web.github.io/actions/workflows/pages/pages-build-deployment/badge.svg)](https://github.com/asset-web/asset-web.github.io/actions/workflows/pages/pages-build-deployment)

## Development

Set up development site
```bash
git clone git@github.com:asset-web/asset-web.git
cd asset-web/
```

NB: Requires docker and docker compose to be installed locally

### Run tests only

```bash
docker build . -t web
docker run --rm web
```

### Run development server

```bash
docker compose build
docker compose up -d

# Run tests against current development enviroment
docker compose exec web /src/script/buildtest  
```

### Update bundler to a specifc version, update all gems, or a particular package, e.g. jekyll

```bash
# Update bundler to a specific version
docker compose run --rm web bundle _2.7.2_ install

#  All
docker compose run --rm web bundle update

# Single gem
docker compose run --rm web bundle update jekyll
```

### Build, test and deploy

CI/CD jobs automate running the `script/buildtest` script which generates the site using Jekyll static site generator.  HTML validation and link checking is run against this output. Upon successfully merging a pull requests/commits to `master` the static website is deployed to a remote server hosted on an app on Digital Ocean.
