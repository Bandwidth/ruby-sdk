require 'URI'

# Unit tests for Bandwidth::Configuration
describe Bandwidth::Configuration do
  let(:config) { Bandwidth::Configuration.new }
  let(:faraday_connection) { Faraday::Connection.new }

  before(:all) do
    @uri = URI.parse(BASE_CALLBACK_URL + '/path')
    @token = 'abcd1234'
    @server = [
      {
        url: 'https://voice.bandwidth.com/api/{enum_var}/{default_var}',
        description: 'Production',
        variables: {
          enum_var: {
            enum_values: ['v1', 'v2', 'v3'],
            default_value: 'v2'
          },
          default_var: {
            default_value: 'default_value'
          }
        }
      }
    ]
  end

  describe '#configure' do
    it 'configures a Configuration instance using a a block' do
      config.configure do |c|
        c.scheme = @uri.scheme
        c.host = @uri.host
        c.base_path = @uri.path
      end
      expect(config.scheme).to eq('https')
      expect(config.host).to eq('localhost')
      expect(config.base_path).to eq('/path')
    end
  end

  describe 'custom attribute writers' do
    it '#scheme=' do
      config.scheme = 'scheme://'
      expect(config.scheme).to eq('scheme')
    end

    it '#host=' do
      config.host = 'https://hostname'
      expect(config.host).to eq('hostname')
    end

    it '#base_path=' do
      config.base_path = 'basepath'
      expect(config.base_path).to eq('/basepath')
    end
  end

  describe '#base_url' do
    it 'Returns default base URL when server_index is nil' do
      config.server_index = nil
      expect(config.base_url).to eq('http://localhost')
    end

    it 'returns empty string when invalid operation is passed' do
      expect(config.base_url('invalid_operation')).to eq('')
    end

    it 'returns proper base URL when server index is set' do
      operation, server = config.operation_server_settings.first
      expect(config.base_url(operation)).to eq(server[0][:url])
    end
  end

  describe '#api_key_with_prefix' do
    it 'gets API key without prefix' do
      config.api_key['Authorization'] = @token
      expect(config.api_key_with_prefix('Authorization')).to eq(@token)
    end

    it 'gets API key wit prefix' do
      config.api_key_prefix['Authorization'] = 'Token'
      config.api_key['Authorization'] = @token
      expect(config.api_key_with_prefix('Authorization')).to eq("Token #{@token}")
    end
  end

  describe '#access_token_with_refresh' do
    it 'gets the static access_token when no access_token_getter is defined' do
      config.access_token = @token
      expect(config.access_token_with_refresh).to eq(@token)
    end

    it 'gets access_token using access_token_getter' do
      config.access_token_getter = proc { @token }
      expect(config.access_token_with_refresh).to eq(@token)
    end
  end

  describe '#basic_auth_token' do
    it 'gets Basic Auth token string' do
      config.username = 'username'
      config.password = 'password'
      expect(config.basic_auth_token).to eq('Basic dXNlcm5hbWU6cGFzc3dvcmQ=')
    end
  end

  describe '#auth_settings' do
    it 'returns Auth Settings hash for api client' do
      basic_auth = config.auth_settings['Basic']
      expect(basic_auth[:type]).to eq('basic')
      expect(basic_auth[:in]).to eq('header')
      expect(basic_auth[:key]).to eq('Authorization')
      expect(basic_auth[:value]).to eq('Basic Og==')
    end
  end

  describe '#server_url' do
    it 'returns URL with enum variable substitued' do
      expect(config.server_url(0, { enum_var: 'v3' }, @server)).to eq('https://voice.bandwidth.com/api/v3/default_value')
    end

    it 'causes an ArgumentError by passing an invalid index' do
      expect {
        config.server_url(100)
      }.to raise_error { |e|
        expect(e).to be_instance_of(ArgumentError)
      }
    end

    it 'causes an ArgumentError by passing an invalid value to an enum variable' do
      expect {
        config.server_url(0, { enum_var: 'v4' }, @server)
      }.to raise_error { |e|
        expect(e).to be_instance_of(ArgumentError)
      }
    end
  end

  describe 'configure faraday connection' do
    it '#configure_faraday_connection #configure_connection' do
      config.configure_faraday_connection do |c|
        config.username = 'username'
      end
      config.configure_connection(faraday_connection)
      expect(config.username).to eq('username')
    end
  end

  describe '#set_faraday_middleware' do
    it '#use' do
      config.use(Faraday::Request::UrlEncoded)
      expect(config.instance_variable_get('@middlewares')[:use]).to eq([[Faraday::Request::UrlEncoded, [], nil]])
    end

    it '#request' do
      config.request(:retry, max: 3, methods: [:get, :post], retry_statuses: [503])
      expect(config.instance_variable_get('@middlewares')[:request]).to eq([[:retry, [{ :max => 3, :methods => [:get, :post], :retry_statuses => [503] }], nil]])
    end

    it '#response' do
      config.response(:logger, nil, { bodies: true, log_level: :debug })
      expect(config.instance_variable_get('@middlewares')[:response]).to eq([[:logger, [nil, { :bodies => true, :log_level => :debug }], nil]])
    end

    it 'causes an ArgumentError by passing an invalid middleware operation' do
      expect {
        config.set_faraday_middleware(:invalid_operation, Faraday::Request::UrlEncoded)
      }.to raise_error { |e|
        expect(e).to be_instance_of(ArgumentError)
      }
    end
  end

  describe '#configure_middleware' do
    it 'builds connection using supplied response middleware' do
      config.response(:logger)
      config.configure_middleware(faraday_connection)
      expect(faraday_connection.builder.handlers).to include(Faraday::Response::Logger)
    end

    it 'builds connection using deleted middleware' do
      config.set_faraday_middleware(:delete, Faraday::Request::UrlEncoded)
      config.configure_middleware(faraday_connection)
      expect(faraday_connection.builder.handlers).to eq([])
    end
  end
end
