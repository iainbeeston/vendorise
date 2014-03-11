require_relative "../../spec_helper"
require_relative "../../../lib/vendorise/parser"

module Vendorise
  describe Parser do
    describe :gem_url do
      it "is nil for pure whitespace urls" do
        expect(Parser.new("     ").gem_url).to eq nil
      end

      it "is nil for nil urls" do
        expect(Parser.new(nil).gem_url).to eq nil
      end

      it "is a http url for a http url" do
        expect(Parser.new("https://github.com/New-Bamboo/vendorise.git").gem_url).to eq "https://github.com/New-Bamboo/vendorise.git"
      end

      it "is a ssh url for a ssh url" do
        expect(Parser.new("git@github.com:New-Bamboo/vendorise.git").gem_url).to eq "git@github.com:New-Bamboo/vendorise.git"
      end
    end

    describe :gem_name do
      it "is the last part of the path for a http url" do
        expect(Parser.new("https://github.com/New-Bamboo/vendorise.git").gem_name).to eq "vendorise"
      end

      it "is the last part of the path for a ssh url" do
        expect(Parser.new("git@github.com:New-Bamboo/vendorise.git").gem_name).to eq "vendorise"
      end
    end
  end
end
