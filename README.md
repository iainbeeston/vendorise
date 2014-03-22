# Vendorise

[![Gem Version](http://img.shields.io/gem/v/vendorise.svg)](http://rubygems.org/gems/vendorise)
[![Build Status](http://img.shields.io/travis/iainbeeston/vendorise/master.svg)](https://travis-ci.org/iainbeeston/vendorise)

Sometimes you need to use a gem that is only available in a private git repository. There are a few ways to do this:

* Install an SSH certificate on your server, but it's not always an option (for example, if you use [Heroku](http://heroku.com))
* Use [Gemfury](http://gemfury.com), but that costs money and potentially creates privacy concerns
* Hard-code an oauth token into your Gemfile (if the gem is hosted on [github](http://github.com)), but then anyone with access to the code also has access to all of your github repositories

Vendorise offers a different way of accessing privately hosted gems, by using git's subtree command to download the gem on your development machine and commit it into the source tree of your repository.

By using subtree, updating the code is straightforward and your server does not need to have access to the private git repository. For more explanation about git subtree and why you'd want to use it, I recommend reading [Alternatives To Git Submodule: Git Subtree](http://blogs.atlassian.com/2013/05/alternatives-to-git-submodule-git-subtree/).

*Note:* vendorise relies on the git subtree command to work - only recent versions of git have this

## Installation

If you're using bundler add this line to your application's Gemfile:

    gem 'vendorise', group: :development

Or if you don't use bundler:

    $ gem install vendorise

## Usage

1. Run `rake "vendorise:gem[repo_url]"` to vendorise the gem hosted at `repo_url` into `/vendor/gems`.
2. Add `gem '<gem_name>', path: 'vendor/gems/<gem_name>'` to your Gemfile

You can update the gem at any time by running the rake task again.

By default the `vendorise:gem` rake task will use the master branch. To use another branch (or tag) specify it as the second parameter, like this:

    rake "vendorise:gem[repo_url, branch]"

