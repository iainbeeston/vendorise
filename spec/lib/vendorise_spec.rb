require_relative "../spec_helper"
require_relative "../../lib/vendorise"

describe "vendorise" do
  after(:each) do
    # remove expect_any_instance_of stubs
    RSpec::Mocks.space.reset_all
  end

  it "adds a rake task to run git subtree" do
    expect_any_instance_of(Rake::FileUtilsExt).to receive(:sh).with("git subtree add --prefix vendor/gems/sinatra git@github.com:sinatra/sinatra.git master --squash")
    Rake.application.invoke_task "vendorise:gem[git@github.com:sinatra/sinatra.git]"
  end

  it "uses the (optional) second argument to select the branch" do
    expect_any_instance_of(Rake::FileUtilsExt).to receive(:sh).with("git subtree add --prefix vendor/gems/sinatra git@github.com:sinatra/sinatra.git 1.3.x --squash")
    Rake.application.invoke_task "vendorise:gem[git@github.com:sinatra/sinatra.git, 1.3.x]"
  end
end
