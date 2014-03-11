require_relative "../../spec_helper"
require_relative "../../../lib/vendorise/arborist"

module Vendorise
  describe Arborist do
    describe :subtree_command do
      subject { Arborist.new "foo/bar", "git@github.com:New-Bamboo/vendorise.git" }

      context "when #subtree_already_exists? is false" do
        before { allow(subject).to receive(:subtree_already_exists?).and_return(false) }

        it "is git subtree add" do
          expect(subject.subtree_command).to eq "git subtree add --prefix foo/bar git@github.com:New-Bamboo/vendorise.git master --squash"
        end
      end

      context "when #subtree_already_exists? is true" do
        before { allow(subject).to receive(:subtree_already_exists?).and_return(true) }

        it "is git subtree pull" do
          expect(subject.subtree_command).to eq "git subtree pull --prefix foo/bar git@github.com:New-Bamboo/vendorise.git master --squash"
        end
      end
    end
  end
end
