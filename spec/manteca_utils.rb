# Helper functions for manteca 
# These are reused in multiple tests

def setup_manteca(type)
    manteca_body = {
      os: OPERATING_SYSTEM,
      language: RUBY_VERSION,
      type: type
    }
    manteca_test_url = URI(MANTECA_BASE_URL + "/tests")
    manteca_header = { 'Content-Type': 'application/json' }
  
    begin
      test_id = Net::HTTP.post(manteca_test_url, manteca_body.to_json, manteca_header)
      return test_id.body.to_s.gsub("\"", "")
    rescue => e
      puts e.inspect
    end
end

def create_manteca_call(tag = "ruby", answer_path = "/bxml/pause", calls_api)
    manteca_call_body = Bandwidth::CreateCall.new(
      application_id: MANTECA_APPLICATION_ID,
      to: MANTECA_IDLE_NUMBER,
      from: MANTECA_ACTIVE_NUMBER,
      answer_url: MANTECA_BASE_URL + answer_path,
      tag: tag
    )
  
    response = calls_api.create_call(BW_ACCOUNT_ID, manteca_call_body)
    $active_calls.append(response.call_id)
    return response.call_id
end

def get_manteca_test_status(test_id)
  manteca_status_url = URI(MANTECA_BASE_URL + "/tests/" + test_id)
  response = JSON.parse(Net::HTTP.get(manteca_status_url))
  return response
end
