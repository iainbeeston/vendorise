require_relative "../spec_helper"
require_relative "../../lib/vendorise"

describe "vendorise" do
  it "adds a rake task to run git subtree" do
    expect(Kernel).to receive(:system).with("git subtree add --prefix vendor/gems/sinatra git@github.com:sinatra/sinatra.git master --squash")
    Rake::Task["vendorise:gem"].invoke("git@github.com:sinatra/sinatra.git")
  end
end
