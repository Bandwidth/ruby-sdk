=begin
#Bandwidth

#Bandwidth's Communication APIs

The version of the OpenAPI document: 1.0.0
Contact: letstalk@bandwidth.com
Generated by: https://openapi-generator.tech
OpenAPI Generator version: 6.4.0

=end

# load the gem
require 'bandwidth-sdk'

# load call utils every time. This prevents an error from occuring when running only unit tests
require_relative './call_utils'

# use webmock to stub HTTP requests
require 'webmock/rspec'

# The following  was generated by the `rspec --init` command. Conventionally, all
# specs live under a `spec` directory, which RSpec adds to the `$LOAD_PATH`.
# The generated `.rspec` file contains `--require spec_helper` which will cause
# this file to always be loaded, without a need to explicitly require it in any
# files.
#
# Given that it is always loaded, you are encouraged to keep this file as
# light-weight as possible. Requiring heavyweight dependencies from this file
# will add to the boot time of your test suite on EVERY test run, even for an
# individual file that may not need all of that loaded. Instead, consider making
# a separate helper file that requires the additional dependencies and performs
# the additional setup, and require it from the spec files that actually need
# it.
#
# The `.rspec` file also contains a few flags that are not defaults but that
# users commonly want.
#
# See http://rubydoc.info/gems/rspec-core/RSpec/Core/Configuration
RSpec.configure do |config|
  config.before(:suite) {
    begin
      BW_USERNAME = ENV.fetch("BW_USERNAME")
      BW_PASSWORD = ENV.fetch("BW_PASSWORD")
      FORBIDDEN_USERNAME = ENV.fetch("BW_USERNAME_FORBIDDEN")
      FORBIDDEN_PASSWORD = ENV.fetch("BW_PASSWORD_FORBIDDEN")
      BW_ACCOUNT_ID = ENV.fetch("BW_ACCOUNT_ID")
      BW_VOICE_APPLICATION_ID = ENV.fetch("BW_VOICE_APPLICATION_ID")
      BW_MESSAGING_APPLICATION_ID = ENV.fetch("BW_MESSAGING_APPLICATION_ID")
      BASE_CALLBACK_URL = ENV.fetch("BASE_CALLBACK_URL")
      BW_NUMBER = ENV.fetch("BW_NUMBER")
      USER_NUMBER = ENV.fetch("USER_NUMBER")
      MANTECA_ACTIVE_NUMBER = ENV.fetch("MANTECA_ACTIVE_NUMBER")
      MANTECA_IDLE_NUMBER = ENV.fetch("MANTECA_IDLE_NUMBER")
      MANTECA_BASE_URL = ENV.fetch("MANTECA_BASE_URL")
      MANTECA_APPLICATION_ID = ENV.fetch("MANTECA_APPLICATION_ID")
      OPERATING_SYSTEM = ENV.fetch("OPERATING_SYSTEM")
      RUBY_VERSION = ENV.fetch("RUBY_VERSION")
    rescue
      puts "Environmental variables not found"
      exit(-1)
    end

    DATA = 0    # index for response array related to the response data
    CODE = 1    # index for response array related to the status code
    SLEEP_TIME_S = 3  # default sleep time in seconds
    MAX_RETRIES = 40
    $active_calls = []

    $complete_call_body = Bandwidth::UpdateCall.new(
      state: Bandwidth::CallStateEnum::COMPLETED
    )
  }

  config.after(:suite) {
    Bandwidth.configure do |config|
      config.username = BW_USERNAME
      config.password = BW_PASSWORD
    end
    calls_api = Bandwidth::CallsApi.new
    # cleanup_calls($active_calls, calls_api)
  }
  
  # rspec-expectations config goes here. You can use an alternate
  # assertion/expectation library such as wrong or the stdlib/minitest
  # assertions if you prefer.
  config.expect_with :rspec do |expectations|
    # This option will default to `true` in RSpec 4. It makes the `description`
    # and `failure_message` of custom matchers include text for helper methods
    # defined using `chain`, e.g.:
    #     be_bigger_than(2).and_smaller_than(4).description
    #     # => "be bigger than 2 and smaller than 4"
    # ...rather than:
    #     # => "be bigger than 2"
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  # rspec-mocks config goes here. You can use an alternate test double
  # library (such as bogus or mocha) by changing the `mock_with` option here.
  config.mock_with :rspec do |mocks|
    # Prevents you from mocking or stubbing a method that does not exist on
    # a real object. This is generally recommended, and will default to
    # `true` in RSpec 4.
    mocks.verify_partial_doubles = true
  end

# The settings below are suggested to provide a good initial experience
# with RSpec, but feel free to customize to your heart's content.
=begin
  # These two settings work together to allow you to limit a spec run
  # to individual examples or groups you care about by tagging them with
  # `:focus` metadata. When nothing is tagged with `:focus`, all examples
  # get run.
  config.filter_run :focus
  config.run_all_when_everything_filtered = true

  # Allows RSpec to persist some state between runs in order to support
  # the `--only-failures` and `--next-failure` CLI options. We recommend
  # you configure your source control system to ignore this file.
  config.example_status_persistence_file_path = "spec/examples.txt"

  # Limits the available syntax to the non-monkey patched syntax that is
  # recommended. For more details, see:
  #   - http://rspec.info/blog/2012/06/rspecs-new-expectation-syntax/
  #   - http://www.teaisaweso.me/blog/2013/05/27/rspecs-new-message-expectation-syntax/
  #   - http://rspec.info/blog/2014/05/notable-changes-in-rspec-3/#zero-monkey-patching-mode
  config.disable_monkey_patching!

  # This setting enables warnings. It's recommended, but in some cases may
  # be too noisy due to issues in dependencies.
  config.warnings = true

  # Many RSpec users commonly either run the entire suite or an individual
  # file, and it's useful to allow more verbose output when running an
  # individual spec file.
  if config.files_to_run.one?
    # Use the documentation formatter for detailed output,
    # unless a formatter has already been configured
    # (e.g. via a command-line flag).
    config.default_formatter = 'doc'
  end

  # Print the 10 slowest examples and example groups at the
  # end of the spec run, to help surface which specs are running
  # particularly slow.
  config.profile_examples = 10

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = :random

  # Seed global randomization in this process using the `--seed` CLI option.
  # Setting this allows you to use `--seed` to deterministically reproduce
  # test failures related to randomization by passing the same `--seed` value
  # as the one that triggered the failure.
  Kernel.srand config.seed
=end
end
