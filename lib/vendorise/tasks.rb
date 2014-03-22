require "rake"
require_relative "parser"
require_relative "arborist"

namespace :vendorise do
  desc "Installs a gem from the specified url to /vendor/gems"
  task :gem, [:url, :branch] do |t, args|
    args.with_defaults(branch: "master")
    parser = Vendorise::Parser.new(args[:url])
    url = parser.gem_url or raise "Please specify a valid url for the gem"
    branch = args[:branch]

    command = Vendorise::Arborist.new("vendor/gems/#{parser.gem_name}", url, branch).subtree_command

    sh(command)
  end
end
