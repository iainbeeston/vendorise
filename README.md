# Vendorise

A reusable rake task to vendorise a gem hosted in a private git repo, using git subtree (requires git 1.8)

## Installation

Add this line to your application's Gemfile:

    gem 'vendorise'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install vendorise

## Usage

1. Run `rake vendorise:gem[repo_url]` to vendorise the gem hosted at `repo_url` into `/vendor/gems`.
2. Add `gem '<gem_name>', path: 'vendor/gems/<gem_name>'` to your Gemfile

You can update the gem at any time by running the rake task again

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
