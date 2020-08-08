# Tessa Alexander - asset-web.co.uk

Migrating static one homepage to Jekyll site to be hosted on Github pages and deployed using Travis CI.

[![Build Status](https://travis-ci.org/asset-web/asset-web.github.io.svg?branch=master)](https://travis-ci.org/asset-web/asset-web.github.io)

## Development

### Linux set up

1. Install Ruby

		sudo apt-get install ruby-full build-essential zlib1g-dev

1. Configure Gem location

		echo '# Install Ruby Gems to ~/gems' >> ~/.bashrc
		echo 'export GEM_HOME="$HOME/gems"' >> ~/.bashrc
		echo 'export PATH="$HOME/gems/bin:$PATH"' >> ~/.bashrc
		source ~/.bashrc

1. Install Jekyll & Bundler

		# Check version requirements here https://pages.github.com/versions/
		gem install jekyll --version 3.8.5
		gem install bundler

1. Set up development site

		git clone git@github.com:asset-web/asset-web.git
		cd asset-web/


### OS X set up

Prerequisite homebrew is installed

	brew install ruby
	echo 'export PATH="/usr/local/opt/ruby/bin:$PATH"' >> ~/.bash_profile
	gem install --user-install bundler jekyll
	echo 'export PATH="$HOME/.gem/ruby/2.7.0/bin:$PATH"' >> ~/.bash_profile


### Example Jekyll development commands

 * Create new site with default theme

		jekyll new .

 * Serve development site

		bundle exec jekyll serve

 * To upgrade, run `bundle update github-pages`.

### Build, test and deploy

Travis CI automates running `script/buildtest` script which generates the site using Jekyll static site generator.  HTML validation and link checking is run against this output. Upon successfully merging a pull request the static site is deployed to a remote server.  The Github pages is then used as a secondary deployment target for all master commits.

Full details can be seen in `.travis.yml`.

#### Travis CI deployment secrets

SSH keys are used to perfrom rsync updates on a remote server.  The private SSH key needs to be named `private key` and encrypted and stored in the repository.

	travis encrypt-file private_key --add

Two secure variables for the SSH user name and remote path need to be stored in the repo, named REMOTE_USER and REMOTE_PATH respectively.  For example:

	travis encrypt REMOTE_USER=username --add
	travis encrypt REMOTE_PATH=/path/to/webroot/ --add
