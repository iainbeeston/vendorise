module Vendorise
  class Parser

    class << self
      def gem_url(url)
        url =~ /^\s+$/ ? nil : url
      end

      def gem_name(url)
        File.basename url, ".git"
      end
    end

  end
end
