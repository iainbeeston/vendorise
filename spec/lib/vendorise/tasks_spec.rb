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
  end
end
