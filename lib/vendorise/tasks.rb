require "rake"
require_relative "parser"

namespace :vendorise do
  desc "Installs a gem from the specified url to /vendor/gems"
  task :gem, :url do |t, args|
    parser = Vendorise::Parser.new(args[:url])
    url = parser.gem_url or raise "Please specify a valid url for the gem"
    path = "vendor/gems/#{parser.gem_name}"
    cmd = Dir.exist?(path) ? "pull" : "add"

    system("git subtree #{cmd} --prefix #{path} #{url} master --squash")
  end
end
