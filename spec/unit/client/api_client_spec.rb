# Unit tests for Bandwidth::ApiClient
describe Bandwidth::ApiClient do
  let(:api_client_default) { Bandwidth::ApiClient.new }
  let(:config) { Bandwidth::Configuration.new }
  let(:faraday_connection) { Faraday::Connection.new }
  let(:api_client) { Bandwidth::ApiClient.new(config) }
  let(:named_media_headers) { { 'content-disposition' => 'filename=test', 'content-type' => 'text/plain' } }
  let(:media_data) { '123456' }
  let(:media_headers) { { 'content-type' => 'text/plain' } }
  let(:json_headers) { { 'content-type' => 'application/json' } }
  let(:multipart_headers) { { 'Content-Type' => 'multipart/form-data' } }
  let(:form_encoded_headers) { { 'Content-Type' => 'application/x-www-form-urlencoded' } }
  let(:error_data) { '{"error": true}' }

  describe '#call_api' do
    it 'calls api and returns a tempfile with name from content-disposition header' do
      stub_request(:get, 'https://messaging.bandwidth.com/api/v2/path').
      to_return(status: 200, headers: media_headers, body: media_data)

      opts = {
        operation: :"MediaApi.get_media",
        header_params: {},
        query_params: {},
        form_params: {},
        body: nil,
        auth_names: ['Basic'],
        return_type: 'File'
      }
      data, status_code, headers = api_client.call_api(:GET, 'path', opts)

      expect(status_code).to eq(200)
      expect(headers).to eq(media_headers)
      expect(data).to be_a(Tempfile)
    end

    it 'calls api and returns a tempfile' do
      stub_request(:get, 'https://messaging.bandwidth.com/api/v2/path').
      to_return(status: 200, headers: named_media_headers, body: media_data)

      opts = {
        operation: :"MediaApi.get_media",
        header_params: {},
        query_params: {},
        form_params: {},
        body: nil,
        auth_names: ['Basic'],
        return_type: 'File'
      }
      data, status_code, headers = api_client.call_api(:GET, 'path', opts)

      expect(status_code).to eq(200)
      expect(headers).to eq(named_media_headers)
      expect(data).to be_a(Tempfile)
    end

    it 'calls api and returns binary data' do
      stub_request(:get, 'https://messaging.bandwidth.com/api/v2/path').
      to_return(status: 200, headers: media_headers, body: media_data)

      api_client.config.return_binary_data = true
      api_client.config.debugging = true

      opts = {
        operation: :"MediaApi.get_media",
        header_params: {},
        query_params: {},
        form_params: {},
        body: nil,
        auth_names: ['Basic'],
        return_type: 'File'
      }
      data, status_code, headers = api_client.call_api(:GET, 'path', opts)

      expect(status_code).to eq(200)
      expect(headers).to eq(media_headers)
      expect(data).to eq(media_data)
    end

    it 'calls api and returns a hash' do
      stub_request(:get, 'https://messaging.bandwidth.com/api/v2/path').
      to_return(status: 200, headers: json_headers, body: '{"id": 1}')

      opts = {
        operation: :"MessagesApi.list_messages",
        header_params: {},
        query_params: {},
        form_params: {},
        body: nil,
        auth_names: ['Basic'],
        return_type: 'Hash<String, Integer>'
      }
      data, status_code, headers = api_client.call_api(:GET, 'path', opts)

      expect(status_code).to eq(200)
      expect(headers).to eq(json_headers)
      expect(data).to eq({ id: 1 })
    end

    it 'posts data and returns nothing' do
      stub_request(:post, 'https://messaging.bandwidth.com/api/v2/path').
      to_return(status: 204)

      api_client.config.debugging = true

      opts = {
        operation: :"MediaApi.upload_media",
        header_params: {},
        query_params: {},
        form_params: {},
        body: { id: 1 },
        auth_names: ['Basic'],
        return_type: nil
      }
      data, status_code = api_client.call_api(:POST, 'path', opts)

      expect(status_code).to eq(204)
      expect(data).to be nil
    end

    it 'posts multipart/form-data and returns nothing' do
      stub_request(:post, 'https://messaging.bandwidth.com/api/v2/path').
      to_return(status: 204)

      opts = {
        operation: :"MediaApi.upload_media",
        header_params: multipart_headers,
        query_params: {},
        form_params: { file: Tempfile.new('filename'), array: [1, 2, 3], string: '123' },
        body: nil,
        auth_names: ['Basic'],
        return_type: nil
      }
      data, status_code = api_client.call_api(:POST, 'path', opts)

      expect(status_code).to eq(204)
      expect(data).to be nil
    end

    it 'calls api and handles HTTP error' do
      stub_request(:post, 'https://messaging.bandwidth.com/api/v2/path').
      to_return(status: 400, headers: json_headers, body: error_data)

      opts = {
        operation: :"MediaApi.upload_media",
        header_params: {},
        query_params: {},
        form_params: {},
        body: { id: 1 },
        auth_names: ['Basic'],
        return_type: nil
      }
      
      expect {
        api_client.call_api(:POST, 'path', opts)
      }.to raise_error { |e|
        expect(e).to be_instance_of(Bandwidth::ApiError)
        expect(e.code).to eq(400)
        expect(e.response_headers).to eq(json_headers)
        expect(e.response_body).to eq('{"error": true}')
      }
    end

    it 'calls api and handles timeout error' do
      stub_request(:post, 'https://messaging.bandwidth.com/api/v2/path').
      to_raise(Faraday::TimeoutError)

      opts = {
        operation: :"MediaApi.upload_media",
        header_params: {},
        query_params: {},
        form_params: {},
        body: { id: 1 },
        auth_names: ['Basic'],
        return_type: nil
      }
      
      expect {
        api_client.call_api(:POST, 'path', opts)
      }.to raise_error { |e|
        expect(e).to be_instance_of(Bandwidth::ApiError)
        expect(e.message).to eq('Connection timed out')
      }
    end

    it 'calls api and handles connection error' do
      stub_request(:post, 'https://messaging.bandwidth.com/api/v2/path').
      to_raise(Faraday::ConnectionFailed)

      opts = {
        operation: :"MediaApi.upload_media",
        header_params: {},
        query_params: {},
        form_params: {},
        body: { id: 1 },
        auth_names: ['Basic'],
        return_type: nil
      }
      
      expect {
        api_client.call_api(:POST, 'path', opts)
      }.to raise_error { |e|
        expect(e).to be_instance_of(Bandwidth::ApiError)
        expect(e.message).to eq('Connection failed')
      }
    end
  end if false # not needed since the api unit tests cover this

  describe '#build_request_body' do
    it 'builds application/x-www-form-urlencoded' do
      expect(api_client_default.build_request_body(form_encoded_headers, { id: 1 }, nil)).to eq('id=1')
    end

    it 'builds empty body' do
      expect(api_client_default.build_request_body({}, {}, nil)).to be nil
    end
  end

  describe '#deserialize' do
    it 'throws on invalid JSON when expecting JSON' do
      headers = { 'Content-Type' => 'application/json' }
      response = double('response', headers: headers, body: '{id 1}')
      expect {
        api_client_default.deserialize(response, 'Hash<String, Integer>')
      }.to raise_error(JSON::ParserError, 'unexpected token at \'{id 1}]\'')
    end

    it 'rescues invalid JSON when expecting non-JSON' do
      headers = { 'Content-Type' => 'application/json' }
      response = double('response', headers: headers, body: '2022-06-16')
      data = api_client_default.deserialize(response, 'Date')
      expect(data).to eq(Date.parse('2022-06-16'))
    end
  end

  describe '#basic_auth' do
    it 'sets basic auth for the connection' do
      api_client.config.username = 'username'
      api_client.config.password = 'password'
      api_client.basic_auth(faraday_connection)
      expect(api_client.config.username).to eq('username')
      expect(api_client.config.password).to eq('password')
    end
  end

  describe '#json_mime?' do
    it 'checks if the given MIME is a JSON MIME' do
      expect(api_client_default.json_mime?(nil)).to eq false
      expect(api_client_default.json_mime?('')).to eq false

      expect(api_client_default.json_mime?('application/json')).to eq true
      expect(api_client_default.json_mime?('application/json; charset=UTF8')).to eq true
      expect(api_client_default.json_mime?('APPLICATION/JSON')).to eq true

      expect(api_client_default.json_mime?('application/xml')).to eq false
      expect(api_client_default.json_mime?('text/plain')).to eq false
      expect(api_client_default.json_mime?('application/jsonp')).to eq false
    end
  end

  describe '#convert_to_type' do
    it 'conversts data to the given return type' do
      expect(api_client_default.convert_to_type(1, 'String')).to eq('1')
      expect(api_client_default.convert_to_type('1', 'Integer')).to eq(1)
      expect(api_client_default.convert_to_type('1', 'Float')).to eq(1.0)
      expect(api_client_default.convert_to_type(1, 'Boolean')).to be false
      expect(api_client_default.convert_to_type('2022-06-16T13:15:07.160Z', 'Time')).to eq(Time.parse('2022-06-16T13:15:07.160Z'))
      expect(api_client_default.convert_to_type('2022-06-16', 'Date')).to eq(Date.parse('2022-06-16'))
      expect(api_client_default.convert_to_type({ id: 1 }, 'Object')).to eq({ id: 1 })
      expect(api_client_default.convert_to_type([[12, 34], [56]], 'Array<Array<Integer>>')).to eq([[12, 34], [56]])
      expect(api_client_default.convert_to_type({ "id": 'test' }, 'Hash<String, String>')).to eq({ id: 'test' })
      expect(api_client_default.convert_to_type({ set_or_expired: true }, 'DeferredResult')).to be_instance_of(Bandwidth::DeferredResult)
    end
  end

  describe '#sanitize_filename' do
    it 'sanitizes a filename by removing the path' do
      expect(api_client_default.sanitize_filename('sun')).to eq('sun')
      expect(api_client_default.sanitize_filename('sun.gif')).to eq('sun.gif')
      expect(api_client_default.sanitize_filename('../sun.gif')).to eq('sun.gif')
      expect(api_client_default.sanitize_filename('/var/tmp/sun.gif')).to eq('sun.gif')
      expect(api_client_default.sanitize_filename('./sun.gif')).to eq('sun.gif')
      expect(api_client_default.sanitize_filename('..\sun.gif')).to eq('sun.gif')
      expect(api_client_default.sanitize_filename('\var\tmp\sun.gif')).to eq('sun.gif')
      expect(api_client_default.sanitize_filename('c:\var\tmp\sun.gif')).to eq('sun.gif')
      expect(api_client_default.sanitize_filename('.\sun.gif')).to eq('sun.gif')
    end
  end
  
  describe '#build_request_url' do
    it 'adds leading and trailing slashes to path' do
      expect(api_client_default.build_request_url('test/path')).to end_with('/test/path')
    end
  end
  
  describe '#update_params_for_auth' do
    it 'updates header and query params based on authentication settings' do
      
    end
  end
  
  describe '#user_agent=' do
    it 'sets user agent in HTTP header' do
      api_client_default.user_agent = 'test-user-agent'
      expect(api_client_default.default_headers['User-Agent']).to eq('test-user-agent')
    end
  end

  describe '#select_header_accept' do
    it 'returns Accept header based on an array of accepts provided' do
      expect(api_client_default.select_header_accept(nil)).to be_nil
      expect(api_client_default.select_header_accept([])).to be_nil

      expect(api_client_default.select_header_accept(['application/json'])).to eq('application/json')
      expect(api_client_default.select_header_accept(['application/xml', 'application/json; charset=UTF8'])).to eq('application/json; charset=UTF8')
      expect(api_client_default.select_header_accept(['APPLICATION/JSON', 'text/html'])).to eq('APPLICATION/JSON')

      expect(api_client_default.select_header_accept(['application/xml'])).to eq('application/xml')
      expect(api_client_default.select_header_accept(['text/html', 'application/xml'])).to eq('text/html,application/xml')
    end
  end

  describe '#select_header_content_type' do
    it 'returns Content-Type header based on an array of content types provided' do
      expect(api_client_default.select_header_content_type(nil)).to be_nil
      expect(api_client_default.select_header_content_type([])).to be_nil

      expect(api_client_default.select_header_content_type(['application/json'])).to eq('application/json')
      expect(api_client_default.select_header_content_type(['application/xml', 'application/json; charset=UTF8'])).to eq('application/json; charset=UTF8')
      expect(api_client_default.select_header_content_type(['APPLICATION/JSON', 'text/html'])).to eq('APPLICATION/JSON')
      expect(api_client_default.select_header_content_type(['application/xml'])).to eq('application/xml')
      expect(api_client_default.select_header_content_type(['text/plain', 'application/xml'])).to eq('text/plain')
    end
  end
  
  describe '#object_to_http_body' do
    it 'converts array to JSON string' do
      model = [1, 2, 3]
      expect(api_client_default.object_to_http_body(model)).to eq('[1,2,3]')
    end

    it 'converts hash to JSON string' do
      model = { id: 1 }
      expect(api_client_default.object_to_http_body(model)).to eq('{"id":1}')
    end
  end
  
  describe '#object_to_hash' do
    it 'returns object when object cannot be converted to hash' do
      model = Object.new
      model.instance_variable_set(:@id, 1)
      expect(api_client_default.object_to_hash(model)).to be_instance_of(Object)
      expect(api_client_default.object_to_hash(model).instance_variable_get('@id')).to eq(1)
    end

    it 'returns hash when object can be converted to hash' do
      model = Bandwidth::DeferredResult.new({
        set_or_expired: true
      })
      expected = { setOrExpired: true }
      expect(api_client_default.object_to_hash(model)).to eq(expected)
    end
  end

  describe '#build_collection_param' do
    it 'builds parameter value according to the given collection format' do
      param = ['aa', 'bb', 'cc']
      expect(api_client_default.build_collection_param(param, :csv)).to eq('aa,bb,cc')
      expect(api_client_default.build_collection_param(param, :ssv)).to eq('aa bb cc')
      expect(api_client_default.build_collection_param(param, :tsv)).to eq("aa\tbb\tcc")
      expect(api_client_default.build_collection_param(param, :pipes)).to eq('aa|bb|cc')
      expect(api_client_default.build_collection_param(param, :multi)).to eq(['aa', 'bb', 'cc'])
      expect {
        api_client_default.build_collection_param(param, :INVALID)
      }.to raise_error(RuntimeError, 'unknown collection format: :INVALID')
    end
  end
end
