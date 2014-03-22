RSpec.configure do |config|
  config.order = 'random'
  config.expect_with(:rspec){ |c| c.syntax = :expect }
  config.mock_with(:rspec){ |c| c.syntax = :expect }

  # don't complain that I'm using symbols as metadata...
  config.treat_symbols_as_metadata_keys_with_true_values = true
  # reseting the mock space doesn't seem to work on jruby
  config.filter_run_excluding :clear_mocks if RUBY_ENGINE == "jruby"
  config.after(:each, :clear_mocks) do
    # expect_any_instance_of hangs around between specs
    RSpec::Mocks.space.reset_all
  end
end
