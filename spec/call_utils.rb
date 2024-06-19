# Helper functions for voice calls
# These are reused in multiple tests

def setup_manteca(type)
  manteca_body = {
    os: OPERATING_SYSTEM,
    language: RUBY_VERSION,
    type: type
  }
  manteca_test_url = URI(MANTECA_BASE_URL + '/tests')
  manteca_header = { 'Content-Type': 'application/json' }
  
  begin
    test_id = Net::HTTP.post(manteca_test_url, manteca_body.to_json, manteca_header)
    test_id.body.to_s
  rescue => e
    puts e.inspect
  end
end

def create_manteca_call(tag = 'ruby', answer_path = '/bxml/pause', calls_api)
  manteca_call_body = Bandwidth::CreateCall.new(
    application_id: MANTECA_APPLICATION_ID,
    to: MANTECA_IDLE_NUMBER,
    from: MANTECA_ACTIVE_NUMBER,
    answer_url: MANTECA_BASE_URL + answer_path,
    tag: tag
  )
  
  response = calls_api.create_call(BW_ACCOUNT_ID, manteca_call_body)
  $active_calls.append(response.call_id)
  response.call_id
end

def get_manteca_test_status(test_id)
  manteca_status_url = URI(MANTECA_BASE_URL + '/tests/' + test_id)
  response = JSON.parse(Net::HTTP.get(manteca_status_url))
  response
end

def cleanup_calls(calls, calls_api)
  attempts = 0
  
  while (calls.length > 0 && attempts < 10)
    calls.delete_if { |call_id| call_ended(call_id, calls_api) }
    sleep(SLEEP_TIME_S)
    attempts += 1
  end
  
  if (calls.length > 0)
    error_message = 'Failed to terminate all calls' + calls.to_s
    raise StandardError.new error_message
  end
end

def call_ended(call_id, calls_api)
  WebMock.allow_net_connect!
  begin
    response = calls_api.get_call_state(BW_ACCOUNT_ID, call_id)
  rescue Bandwidth::ApiError
    return false
  end
  
  if !(response.state == 'disconnected')
    begin
      calls_api.update_call(BW_ACCOUNT_ID, call_id, $complete_call_body)
      return true
    rescue Bandwidth::ApiError
    end
  else
    return true
  end
  WebMock.disable_net_connect!

  false
end
