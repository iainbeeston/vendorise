RSpec.configure do |config|
  config.order = 'random'
  config.expect_with(:rspec){ |c| c.syntax = :expect }
  config.mock_with(:rspec){ |c| c.syntax = :expect }

  config.after(:each, :clear_mocks) do
    # expect_any_instance_of hangs around between specs
    RSpec::Mocks.space.reset_all
  end
end
