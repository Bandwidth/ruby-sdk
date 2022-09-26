=begin
#Bandwidth

#Bandwidth's Communication APIs

The version of the OpenAPI document: 1.0.0
Contact: letstalk@bandwidth.com
Generated by: https://openapi-generator.tech
OpenAPI Generator version: 6.2.0

=end

require 'spec_helper'
require 'json'

# Unit tests for Bandwidth::PhoneNumberLookupApi
# Automatically generated by openapi-generator (https://openapi-generator.tech)
# Please update as you see appropriate
describe 'PhoneNumberLookupApi' do
  before do
    # run before each test
    @api_instance = Bandwidth::PhoneNumberLookupApi.new
  end

  after do
    # run after each test
  end

  describe 'test an instance of PhoneNumberLookupApi' do
    it 'should create an instance of PhoneNumberLookupApi' do
      expect(@api_instance).to be_instance_of(Bandwidth::PhoneNumberLookupApi)
    end
  end

  # unit tests for create_lookup
  # Create Lookup
  # Create a Phone Number Lookup Request.
  # @param account_id The ID of the Bandwidth account that the user belongs to.
  # @param lookup_request Phone number lookup request.
  # @param [Hash] opts the optional parameters
  # @return [CreateLookupResponse]
  describe 'create_lookup test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for get_lookup_status
  # Get Lookup Request Status
  # Get an existing Phone Number Lookup Request.
  # @param account_id The ID of the Bandwidth account that the user belongs to.
  # @param request_id The phone number lookup request ID from Bandwidth.
  # @param [Hash] opts the optional parameters
  # @return [LookupStatus]
  describe 'get_lookup_status test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

end
