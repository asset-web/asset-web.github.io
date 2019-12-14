# Tessa Alexander - asset-web.co.uk

Migrating static one homepage to Jekyll site to be hosted on Github pages and deployed using Travis CI.

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

### Example Jekyll development commands

 * Create new site with default theme

		jekyll new .

 * Serve development site

		bundle exec jekyll serve

 * To upgrade, run `bundle update github-pages`.

### Build and deployment

See `.travis.yml`