# Tessa Alexander - asset-web.co.uk

Migrating static one homepage to Jekyll site to be hosted on GitHub pages and deployed using Travis CI.

[![Build and test status](https://github.com/asset-web/asset-web.github.io/actions/workflows/docker.yml/badge.svg)](https://github.com/asset-web/asset-web.github.io/actions/workflows/docker.yml)
[![GitHub pages backup deployment](https://github.com/asset-web/asset-web.github.io/actions/workflows/pages/pages-build-deployment/badge.svg)](https://github.com/asset-web/asset-web.github.io/actions/workflows/pages/pages-build-deployment)

## Development

Set up development site

	git clone git@github.com:asset-web/asset-web.git
	cd asset-web/

NB: Requires docker and docker compose to be installed locally

Run tests locally
```
docker build . -t web
docker run --rm web
```

```
docker compose build
docker compose up -d 
docker compose exec web /src/script/buildtest  # Run tests locally
```

Run dev server update bundler and then update a particular package, e.g. jekyll

```
docker compose up -d
docker compose exec web bundle update --bundler
docker compose exec web bundle update jekyll
```

### Example Jekyll development commands when installed locally

 * Create new site with default theme

		jekyll new .

 * Serve development site

		bundle exec jekyll serve

	
### Build, test and deploy

CI/CD jobs automate running the `script/buildtest` script which generates the site using Jekyll static site generator.  HTML validation and link checking is run against this output. Upon successfully merging a pull requests/commits to `master` the static website is deployed to a remote server hosted on an app on Digital Ocean.
