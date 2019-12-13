# Tessa Alexander - asset-web.co.uk

Migrating static one homepage to Jekyll site to be hosted on Gituhb pages and deployed usign Travis CI.

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

		git clone git@github.com:asset-web/tinevanlent.be.git
		cd tinevanlent.be/

### Example Jekyll commands

 * Create new site with default theme

		jekyll new .

 * Serve develpoment site

		bundle exec jekyll serve

 * Build production site

		JEKYLL_ENV=production jekyll build

 * Example deployment

		cd _site
		rsync -r . username@host:/webroot/
