# Unit tests for Bandwidth::ApiClient
describe Bandwidth::ApiClient do
  describe 'proxy in #build_connection' do
    let(:config) { Bandwidth::Configuration.new }
    let(:api_client) { Bandwidth::ApiClient.new(config) }
    let(:proxy_uri) { URI('http://example.org:8080') }

    # it 'defaults to nil' do
    #   expect(Bandwidth::Configuration.default.proxy).to be_nil
    #   expect(config.proxy).to be_nil

    #   connection = api_client.build_connection
    #   expect(connection.proxy_for_request('/test')).to be_nil
    # end

    it 'can be customized with a string' do
      config.proxy = proxy_uri.to_s

      connection = api_client.build_connection
      configured_proxy = connection.proxy_for_request('/test')

      expect(configured_proxy).not_to be_nil
      expect(configured_proxy.uri.to_s).to eq proxy_uri.to_s
    end

    it 'can be customized with a hash' do
      config.proxy = { uri: proxy_uri }

      connection = api_client.build_connection
      configured_proxy = connection.proxy_for_request('/test')

      expect(configured_proxy).not_to be_nil
      expect(configured_proxy.uri).to eq proxy_uri
    end
  end

  describe '#deserialize' do
    it 'handles Array<Integer>' do
      api_client = Bandwidth::ApiClient.new
      headers = { 'Content-Type' => 'application/json' }
      response = double('response', headers: headers, body: '[12, 34]')
      data = api_client.deserialize(response, 'Array<Integer>')
      expect(data).to be_instance_of(Array)
      expect(data).to eq([12, 34])
    end

    it 'handles Array<Array<Integer>>' do
      api_client = Bandwidth::ApiClient.new
      headers = { 'Content-Type' => 'application/json' }
      response = double('response', headers: headers, body: '[[12, 34], [56]]')
      data = api_client.deserialize(response, 'Array<Array<Integer>>')
      expect(data).to be_instance_of(Array)
      expect(data).to eq([[12, 34], [56]])
    end

    it 'handles Hash<String, String>' do
      api_client = Bandwidth::ApiClient.new
      headers = { 'Content-Type' => 'application/json' }
      response = double('response', headers: headers, body: '{"message": "Hello"}')
      data = api_client.deserialize(response, 'Hash<String, String>')
      expect(data).to be_instance_of(Hash)
      expect(data).to eq(:message => 'Hello')
    end
  end

  describe '#object_to_hash' do
    it 'ignores nils and includes empty arrays' do
      # uncomment below to test object_to_hash for model
      # api_client = Bandwidth::ApiClient.new
      # _model = Bandwidth::ModelName.new
      # update the model attribute below
      # _model.id = 1
      # update the expected value (hash) below
      # expected = {id: 1, name: '', tags: []}
      # expect(api_client.object_to_hash(_model)).to eq(expected)
    end
  end

  describe '#build_collection_param' do
    let(:param) { ['aa', 'bb', 'cc'] }
    let(:api_client) { Bandwidth::ApiClient.new }

    it 'works for csv' do
      expect(api_client.build_collection_param(param, :csv)).to eq('aa,bb,cc')
    end

    it 'works for ssv' do
      expect(api_client.build_collection_param(param, :ssv)).to eq('aa bb cc')
    end

    it 'works for tsv' do
      expect(api_client.build_collection_param(param, :tsv)).to eq("aa\tbb\tcc")
    end

    it 'works for pipes' do
      expect(api_client.build_collection_param(param, :pipes)).to eq('aa|bb|cc')
    end

    it 'works for multi' do
      expect(api_client.build_collection_param(param, :multi)).to eq(['aa', 'bb', 'cc'])
    end

    it 'fails for invalid collection format' do
      expect { api_client.build_collection_param(param, :INVALID) }.to raise_error(RuntimeError, 'unknown collection format: :INVALID')
    end
  end

  describe '#json_mime?' do
    let(:api_client) { Bandwidth::ApiClient.new }

    it 'works' do
      expect(api_client.json_mime?(nil)).to eq false
      expect(api_client.json_mime?('')).to eq false

      expect(api_client.json_mime?('application/json')).to eq true
      expect(api_client.json_mime?('application/json; charset=UTF8')).to eq true
      expect(api_client.json_mime?('APPLICATION/JSON')).to eq true

      expect(api_client.json_mime?('application/xml')).to eq false
      expect(api_client.json_mime?('text/plain')).to eq false
      expect(api_client.json_mime?('application/jsonp')).to eq false
    end
  end

  describe '#select_header_accept' do
    let(:api_client) { Bandwidth::ApiClient.new }

    it 'works' do
      expect(api_client.select_header_accept(nil)).to be_nil
      expect(api_client.select_header_accept([])).to be_nil

      expect(api_client.select_header_accept(['application/json'])).to eq('application/json')
      expect(api_client.select_header_accept(['application/xml', 'application/json; charset=UTF8'])).to eq('application/json; charset=UTF8')
      expect(api_client.select_header_accept(['APPLICATION/JSON', 'text/html'])).to eq('APPLICATION/JSON')

      expect(api_client.select_header_accept(['application/xml'])).to eq('application/xml')
      expect(api_client.select_header_accept(['text/html', 'application/xml'])).to eq('text/html,application/xml')
    end
  end

  describe '#select_header_content_type' do
    let(:api_client) { Bandwidth::ApiClient.new }

    it 'works' do
      expect(api_client.select_header_content_type(nil)).to be_nil
      expect(api_client.select_header_content_type([])).to be_nil

      expect(api_client.select_header_content_type(['application/json'])).to eq('application/json')
      expect(api_client.select_header_content_type(['application/xml', 'application/json; charset=UTF8'])).to eq('application/json; charset=UTF8')
      expect(api_client.select_header_content_type(['APPLICATION/JSON', 'text/html'])).to eq('APPLICATION/JSON')
      expect(api_client.select_header_content_type(['application/xml'])).to eq('application/xml')
      expect(api_client.select_header_content_type(['text/plain', 'application/xml'])).to eq('text/plain')
    end
  end

  describe '#sanitize_filename' do
    let(:api_client) { Bandwidth::ApiClient.new }

    it 'works' do
      expect(api_client.sanitize_filename('sun')).to eq('sun')
      expect(api_client.sanitize_filename('sun.gif')).to eq('sun.gif')
      expect(api_client.sanitize_filename('../sun.gif')).to eq('sun.gif')
      expect(api_client.sanitize_filename('/var/tmp/sun.gif')).to eq('sun.gif')
      expect(api_client.sanitize_filename('./sun.gif')).to eq('sun.gif')
      expect(api_client.sanitize_filename('..\sun.gif')).to eq('sun.gif')
      expect(api_client.sanitize_filename('\var\tmp\sun.gif')).to eq('sun.gif')
      expect(api_client.sanitize_filename('c:\var\tmp\sun.gif')).to eq('sun.gif')
      expect(api_client.sanitize_filename('.\sun.gif')).to eq('sun.gif')
    end
  end

  # HTTP 4XX Errors
  describe 'http error' do
    it 'causes a 400 error' do
      stub_request(:post, "https://voice.bandwidth.com/api/v2/accounts/#{BW_ACCOUNT_ID}/calls").
      to_return(status: 400, body: @create_call_bad_request_stub)

      call_body_bad = Bandwidth::CreateCall.new(
        application_id: BW_VOICE_APPLICATION_ID,
        to: '+1invalid',
        from: BW_NUMBER,
        answer_url: @answer_url,
        answer_method: @answer_method,
        disconnect_url: @disconnect_url,
        disconnect_method: @disconnect_method
      )

      expect {
        @calls_api_instance.create_call(BW_ACCOUNT_ID, call_body_bad)
      }.to raise_error { |e|
        expect(e).to be_instance_of(Bandwidth::ApiError)
        expect(e.code).to eq(400)
      }
    end

    it 'causes a 404 error' do
      dne_id = 'does-not-exist'

      stub_request(:get, "https://voice.bandwidth.com/api/v2/accounts/#{BW_ACCOUNT_ID}/calls/#{dne_id}").
      to_return(status: 404, body: @get_call_state_not_found_stub)

      expect {
        @calls_api_instance.get_call_state(BW_ACCOUNT_ID, dne_id)
      }.to raise_error { |e|
        expect(e).to be_instance_of(Bandwidth::ApiError)
        expect(e.code).to eq(404)
      }
    end

    it 'causes a 401 error' do
      stub_request(:get, "https://voice.bandwidth.com/api/v2/accounts/#{BW_ACCOUNT_ID}/calls/#{@call_id}").
      to_return(status: 401, body: @get_call_state_unauthorized_stub)

      expect {
        @calls_api_instance.get_call_state(BW_ACCOUNT_ID, @call_id)
      }.to raise_error { |e|
        expect(e).to be_instance_of(Bandwidth::ApiError)
        expect(e.code).to eq(401)
      }
    end

    it 'causes a 403 error' do
      stub_request(:get, "https://voice.bandwidth.com/api/v2/accounts/#{BW_ACCOUNT_ID}/calls/#{@call_id}").
      to_return(status: 403, body: @get_call_state_forbidden_stub)

      expect {
        @calls_api_instance.get_call_state_with_http_info(BW_ACCOUNT_ID, @call_id)
      }.to raise_error { |e|
        expect(e).to be_instance_of(Bandwidth::ApiError)
        expect(e.code).to eq(403)
      }
    end
  end if false # (`if false` skips this entire block)

end
