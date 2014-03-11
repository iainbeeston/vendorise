module Vendorise
  class Arborist
    attr_reader :path, :url

    def initialize(path, url)
      @path = path
      @url = url
    end

    def subtree_already_exists?
      Dir.exist?(path)
    end

    def subtree_command
      cmd = subtree_already_exists? ? "pull" : "add"
      "git subtree #{cmd} --prefix #{path} #{url} master --squash"
    end
  end
end
