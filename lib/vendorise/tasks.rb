require "rake"
require_relative "parser"
require_relative "arborist"

namespace :vendorise do
  desc "Installs a gem from the specified url to /vendor/gems"
  task :gem, :url do |t, args|
    parser = Vendorise::Parser.new(args[:url])
    url = parser.gem_url or raise "Please specify a valid url for the gem"

    command = Vendorise::Arborist.new("vendor/gems/#{parser.gem_name}", url).subtree_command

    sh(command)
  end
end
