require_relative "../spec_helper"
require_relative "../../lib/vendorise"

describe "vendorise" do
  it "adds a rake task to run git subtree", :clear_mocks do
    expect_any_instance_of(Rake::FileUtilsExt).to receive(:sh).with("git subtree add --prefix vendor/gems/sinatra git@github.com:sinatra/sinatra.git master --squash")
    Rake.application.invoke_task "vendorise:gem[git@github.com:sinatra/sinatra.git]"
  end

  it "uses the (optional) second argument to select the branch", :clear_mocks do
    expect_any_instance_of(Rake::FileUtilsExt).to receive(:sh).with("git subtree add --prefix vendor/gems/sinatra git@github.com:sinatra/sinatra.git 1.3.x --squash")
    Rake.application.invoke_task "vendorise:gem[git@github.com:sinatra/sinatra.git, 1.3.x]"
  end
end

