require_relative "../../spec_helper.rb"
require_relative "../../../lib/vendorise/parser"

module Vendorise
  describe Parser do
    describe :gem_url do
      it "is nil for pure whitespace urls" do
        expect(Vendorise::Parser.gem_url("     ")).to eq nil
      end

      it "is nil for nil urls" do
        expect(Vendorise::Parser.gem_url(nil)).to eq nil
      end

      it "is a http url for a http url" do
        expect(Vendorise::Parser.gem_url("https://github.com/New-Bamboo/vendorise.git")).to eq "https://github.com/New-Bamboo/vendorise.git"
      end

      it "is a ssh url for a ssh url" do
        expect(Vendorise::Parser.gem_url("git@github.com:New-Bamboo/vendorise.git")).to eq "git@github.com:New-Bamboo/vendorise.git"
      end
    end

    describe :gem_name do
      it "is the last part of the path for a http url" do
        expect(Vendorise::Parser.gem_name("https://github.com/New-Bamboo/vendorise.git")).to eq "vendorise"
      end

      it "is the last part of the path for a ssh url" do
        expect(Vendorise::Parser.gem_name("git@github.com:New-Bamboo/vendorise.git")).to eq "vendorise"
      end
    end
  end
end
