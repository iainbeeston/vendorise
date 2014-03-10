# Vendorise

Sometimes you need to use a gem in your app that is hosted in a private git repository. That's not a problem if you can install an SSH certificate on your server (then you can install the gem directly on the server), but it's not always an option (for example, if you use [Heroku](http://heroku.com)). Another alternative is to use a solution like [Gemfury](http://gemfury.com), but that's not always an option either. If you use [github](http://github.com), you can hard-code an oauth token into your Gemfile, but means anyone with access to the source code of your app also has access to all of your github repositories.

Vendorise offers a different way of accessing privately hosted gems, by using git's subtree command to download the gem on your development machine and commit it into the source tree of your repository, but still allowing the gem to be updated.

*Note:* vendorise relies on the git subtree command to work - only recent versions of git have this

## Installation

Add this line to your application's Gemfile (if you're using Rails, only add it to the development group):

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
