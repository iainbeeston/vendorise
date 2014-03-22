require_relative "../../spec_helper"
require_relative "../../../lib/vendorise/arborist"

module Vendorise
  describe Arborist do
    let(:subtree_already_exists?) { false }

    before { allow(subject).to receive(:subtree_already_exists?).and_return(subtree_already_exists?) }

    context "when branch is specified in the constructor" do
      subject { Arborist.new "foo/bar", "git@github.com:New-Bamboo/vendorise.git", "development" }

      it "makes #subtree_command use that branch" do
        expect(subject.subtree_command).to eq "git subtree add --prefix foo/bar git@github.com:New-Bamboo/vendorise.git development --squash"
      end
    end

    describe :subtree_already_exists? do
      subject { Arborist.new "foo/bar", "git@github.com:New-Bamboo/vendorise.git", "master" }

      context "is false" do
        it "makes #subtree_command use 'git subtree add'" do
          expect(subject.subtree_command).to eq "git subtree add --prefix foo/bar git@github.com:New-Bamboo/vendorise.git master --squash"
        end
      end

      context "is true" do
        let(:subtree_already_exists?) { true }

        it "makes #subtree_command use 'git subtree pull'" do
          expect(subject.subtree_command).to eq "git subtree pull --prefix foo/bar git@github.com:New-Bamboo/vendorise.git master --squash"
        end
      end
    end
  end
end
