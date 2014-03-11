require_relative "../../spec_helper.rb"
require_relative "../../../lib/vendorise/tasks"

module Vendorise
  describe "rake vendorise:gem" do
    subject(:task) { Rake::Task["vendorise:gem"] }

    it "defines vendorise:gem" do
      expect(task).to_not eq nil
    end

    it "accepts a url argument" do
      expect(task.arg_names).to match_array [:url]
    end

    it "creates a new arborist and passes it's command to system" do
      fake_arborist = double("Arborist", subtree_command: "touch foo.tmp")
      allow(Vendorise::Arborist).to receive(:new).with("vendor/gems/vendorise", "git@github.com:New-Bamboo/vendorise.git").and_return(fake_arborist)

      task.invoke("git@github.com:New-Bamboo/vendorise.git")

      expect(File.exist?("foo.tmp")).to be true
      File.delete("foo.tmp")
    end
  end
end
