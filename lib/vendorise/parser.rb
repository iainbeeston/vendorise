module Vendorise
  class Parser
    attr_reader :url

    def initialize(url)
      @url = url
    end

    def gem_url
      url =~ /^\s+$/ ? nil : url
    end

    def gem_name
      File.basename url, ".git"
    end
  end
end
