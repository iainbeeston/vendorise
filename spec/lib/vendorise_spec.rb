require_relative "../spec_helper"
require_relative "../../lib/vendorise"

describe "vendorise" do
  before do
    Rake::Task["vendorise:gem"].reenable
  end

  it "adds a rake task to run git subtree" do
    expect(Rake::AltSystem).to receive(:system) do |cmd|
      expect(cmd).to eq("git subtree add --prefix vendor/gems/sinatra git@github.com:sinatra/sinatra.git master --squash")
    end
    Rake.application.invoke_task "vendorise:gem[git@github.com:sinatra/sinatra.git]"
  end

  it "uses the (optional) second argument to select the branch" do
    expect(Rake::AltSystem).to receive(:system) do |cmd|
      expect(cmd).to eq("git subtree add --prefix vendor/gems/sinatra git@github.com:sinatra/sinatra.git 1.3.x --squash")
    end
    Rake.application.invoke_task "vendorise:gem[git@github.com:sinatra/sinatra.git, 1.3.x]"
  end
end

