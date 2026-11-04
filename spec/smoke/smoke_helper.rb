require_relative '../call_utils'

RSpec.configure do |config|
  config.before(:suite) {
    begin
      BW_CLIENT_ID = ENV.fetch('BW_CLIENT_ID')
      BW_CLIENT_SECRET = ENV.fetch('BW_CLIENT_SECRET')
      BW_ACCOUNT_ID = ENV.fetch('BW_ACCOUNT_ID')
      BW_VOICE_APPLICATION_ID = ENV.fetch('BW_VOICE_APPLICATION_ID')
      BW_MESSAGING_APPLICATION_ID = ENV.fetch('BW_MESSAGING_APPLICATION_ID')
      BASE_CALLBACK_URL = ENV.fetch('BASE_CALLBACK_URL')
      BW_NUMBER = ENV.fetch('BW_NUMBER')
      USER_NUMBER = ENV.fetch('USER_NUMBER')
      MANTECA_ACTIVE_NUMBER = ENV.fetch('MANTECA_ACTIVE_NUMBER')
      MANTECA_IDLE_NUMBER = ENV.fetch('MANTECA_IDLE_NUMBER')
      MANTECA_BASE_URL = ENV.fetch('MANTECA_BASE_URL')
      MANTECA_APPLICATION_ID = ENV.fetch('MANTECA_APPLICATION_ID')
      OPERATING_SYSTEM = ENV.fetch('OPERATING_SYSTEM')
    rescue
      puts 'Environmental variables not found'
      exit(-1)
    end

    SLEEP_TIME_S = 3  # default sleep time in seconds
    MAX_RETRIES = 40
    $active_calls = []

    $complete_call_body = Bandwidth::UpdateCall.new(
      state: Bandwidth::CallStateEnum::COMPLETED
    )
  }

  config.after(:suite) {
    Bandwidth.configure do |config|
      config.client_id = BW_CLIENT_ID
      config.client_secret = BW_CLIENT_SECRET
    end
    calls_api = Bandwidth::CallsApi.new
    cleanup_calls($active_calls, calls_api)
  }
end
