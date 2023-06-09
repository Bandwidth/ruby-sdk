=begin
#Bandwidth

#Bandwidth's Communication APIs

The version of the OpenAPI document: 1.0.0
Contact: letstalk@bandwidth.com
Generated by: https://openapi-generator.tech
OpenAPI Generator version: 6.6.0

=end

require 'spec_helper'

describe Bandwidth::Configuration do
  let(:config) { Bandwidth::Configuration.default }

  before(:each) do
    # uncomment below to setup host and base_path
    # require 'URI'
    # uri = URI.parse("http://localhost")
    # Bandwidth.configure do |c|
    #   c.host = uri.host
    #   c.base_path = uri.path
    # end
  end

  describe '#base_url' do
    it 'should have the default value' do
      # uncomment below to test default value of the base path
      # expect(config.base_url).to eq("http://localhost")
    end

    it 'should remove trailing slashes' do
      [nil, '', '/', '//'].each do |base_path|
        config.base_path = base_path
        # uncomment below to test trailing slashes
        # expect(config.base_url).to eq("http://localhost")
      end
    end
  end

  describe '#configure_faraday_connection' do
    let(:faraday_connection) { Faraday::Connection.new }

    before do
      stub_const('CustomAdapter', Class.new(Faraday::Adapter))
      stub_const('AnotherCustomAdapter', Class.new(Faraday::Adapter))

      config.configure_faraday_connection do |conn|
        conn.adapter CustomAdapter
        conn.response :logger, nil, headers: true, bodies: true, log_level: :debug do |logger|
          logger.filter(/(Authorization: )(.*)/, '\1[REDACTED]')
        end
      end
    end

    it 'adds a block that will be used to configure the connection' do
      expect(faraday_connection.adapter).to eq(Faraday::Adapter::NetHttp)
      expect(faraday_connection.builder.handlers).to_not include(Faraday::Response::Logger)

      config.configure_connection(faraday_connection)

      expect(faraday_connection.adapter).to eq(CustomAdapter)
      expect(faraday_connection.builder.handlers).to include(Faraday::Response::Logger)
    end

    it 'supports multiple configuration blocks' do
      config.configure_faraday_connection do |conn|
        conn.adapter AnotherCustomAdapter
      end

      expect(faraday_connection.adapter).to eq(Faraday::Adapter::NetHttp)
      expect(faraday_connection.builder.handlers).to_not include(Faraday::Response::Logger)

      config.configure_connection(faraday_connection)

      expect(faraday_connection.adapter).to eq(AnotherCustomAdapter)
      expect(faraday_connection.builder.handlers).to include(Faraday::Response::Logger)
    end
  end
end
