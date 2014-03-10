require "rake"
require_relative "parser"

namespace :vendorise do
  desc "Installs a gem from the specified url to /vendor/gems"
  task :gem, :url do |t, args|
    url = Vendorise::Parser.gem_url(args[:url]) or raise "Please specify a valid url for the gem"
    path = "vendor/gems/#{Vendorise::Parser.gem_name(args[:url])}"
    cmd = Dir.exist?(path) ? "pull" : "add"

    puts `git subtree #{cmd} --prefix #{path} #{url} master --squash`
  end
end
