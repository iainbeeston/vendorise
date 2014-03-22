require_relative "../../spec_helper"
require_relative "../../../lib/vendorise/arborist"

module Vendorise
  describe Arborist do
    describe :subtree_already_exists? do
      subject { Arborist.new "foo/bar", "git@github.com:New-Bamboo/vendorise.git" }

      context "is false" do
        before { allow(subject).to receive(:subtree_already_exists?).and_return(false) }

        it "makes #subtree_command use 'git subtree add'" do
          expect(subject.subtree_command).to eq "git subtree add --prefix foo/bar git@github.com:New-Bamboo/vendorise.git master --squash"
        end
      end

      context "is true" do
        before { allow(subject).to receive(:subtree_already_exists?).and_return(true) }

        it "makes #subtree_command use 'git subtree pull'" do
          expect(subject.subtree_command).to eq "git subtree pull --prefix foo/bar git@github.com:New-Bamboo/vendorise.git master --squash"
        end
      end
    end
  end
end
