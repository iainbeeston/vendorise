module Vendorise
  class Arborist
    attr_reader :path, :url, :branch

    def initialize(path, url, branch)
      @path = path
      @url = url
      @branch = branch
    end

    def subtree_already_exists?
      Dir.exist?(path)
    end

    def subtree_command
      cmd = subtree_already_exists? ? "pull" : "add"
      "git subtree #{cmd} --prefix #{path} #{url} #{branch} --squash"
    end
  end
end
