# Unit tests for Bandwidth::VerificationRequest
describe Bandwidth::VerificationRequest do
  let(:verification_request_default) { Bandwidth::VerificationRequest.new({
    business_address: { name: 'Bandwidth' },
    business_contact: { firstName: 'Jane' },
    message_volume: 100,
    phone_numbers: ['+18005550100'],
    use_case: 'baseline use case',
    use_case_summary: 'baseline summary',
    production_message_content: 'baseline message',
    opt_in_workflow: { description: 'baseline opt-in', imageUrls: [] },
    business_entity_type: Bandwidth::BusinessEntityTypeEnum::PRIVATE_PROFIT
  }) }
  let(:verification_request_values) { Bandwidth::VerificationRequest.new({
    business_address: { name: 'Bandwidth' },
    business_contact: { firstName: 'Jane' },
    message_volume: 1000,
    phone_numbers: ['+18005554321'],
    use_case: 'Customer notifications',
    use_case_summary: 'Send customers updates about their orders',
    production_message_content: 'Your order has shipped',
    opt_in_workflow: { description: 'opt-in via website', imageUrls: ['https://example.com/optin.png'] },
    additional_information: 'extra info',
    isv_reseller: 'My ISV',
    privacy_policy_url: 'https://example.com/privacy',
    terms_and_conditions_url: 'https://example.com/terms',
    business_dba: 'Bandwidth Inc',
    business_registration_number: '12-3456789',
    business_registration_type: Bandwidth::BusinessRegistrationTypeEnum::EIN,
    business_registration_issuing_country: 'USA',
    business_entity_type: Bandwidth::BusinessEntityTypeEnum::PRIVATE_PROFIT,
    help_message_response: 'For help reply with HELP',
    age_gated_content: false,
    cv_token: 'cv_token_value'
  }) }

  describe '#initialize' do
    it 'causes an ArgumentError by passing an Array to the initialize method' do
      expect {
        Bandwidth::VerificationRequest.new([])
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError by passing an invalid attribute to the initialize method' do
      expect {
        Bandwidth::VerificationRequest.new({ invalid: true })
      }.to raise_error(ArgumentError)
    end
  end

  describe '#acceptable_attributes' do
    it 'expects acceptable JSON attributes to be those in the attribute map' do
      expect(Bandwidth::VerificationRequest.acceptable_attributes).to eq(Bandwidth::VerificationRequest.attribute_map.values)
    end
  end

  describe '#openapi_nullable' do
    it 'expects nullable attributes to be the set of nullable fields' do
      expect(Bandwidth::VerificationRequest.openapi_nullable).to eq(Set.new([
        :'additional_information',
        :'isv_reseller',
        :'business_registration_number',
        :'business_registration_type',
        :'business_registration_issuing_country',
        :'help_message_response',
        :'cv_token'
      ]))
    end
  end

  describe '#build_from_hash' do
    it 'validates instance of VerificationRequest created by the build_from_hash method' do
      verification_request_from_hash = Bandwidth::VerificationRequest.build_from_hash({
        businessAddress: { name: 'Bandwidth', addr1: '900 Main Campus Dr', city: 'Raleigh', state: 'NC', zip: '27606', url: 'https://www.bandwidth.com' },
        businessContact: { firstName: 'Jane', lastName: 'Doe', email: 'jane@bandwidth.com', phoneNumber: '+19195551234' },
        messageVolume: 1000,
        phoneNumbers: ['+18005554321'],
        useCase: 'Customer notifications',
        useCaseSummary: 'Send customers updates about their orders',
        productionMessageContent: 'Your order has shipped',
        optInWorkflow: { description: 'opt-in via website', imageUrls: ['https://example.com/optin.png'] },
        additionalInformation: 'extra info',
        isvReseller: 'My ISV',
        privacyPolicyUrl: 'https://example.com/privacy',
        termsAndConditionsUrl: 'https://example.com/terms',
        businessDba: 'Bandwidth Inc',
        businessRegistrationNumber: '12-3456789',
        businessRegistrationType: Bandwidth::BusinessRegistrationTypeEnum::EIN,
        businessRegistrationIssuingCountry: 'USA',
        businessEntityType: Bandwidth::BusinessEntityTypeEnum::PRIVATE_PROFIT,
        helpMessageResponse: 'For help reply with HELP',
        ageGatedContent: false,
        cvToken: 'cv_token_value'
      })
      expect(verification_request_from_hash).to be_instance_of(Bandwidth::VerificationRequest)
      expect(verification_request_from_hash.business_address).to be_instance_of(Bandwidth::Address)
      expect(verification_request_from_hash.business_contact).to be_instance_of(Bandwidth::Contact)
      expect(verification_request_from_hash.message_volume).to eq(1000)
      expect(verification_request_from_hash.phone_numbers).to eq(['+18005554321'])
      expect(verification_request_from_hash.use_case).to eq('Customer notifications')
      expect(verification_request_from_hash.use_case_summary).to eq('Send customers updates about their orders')
      expect(verification_request_from_hash.production_message_content).to eq('Your order has shipped')
      expect(verification_request_from_hash.opt_in_workflow).to be_instance_of(Bandwidth::OptInWorkflow)
      expect(verification_request_from_hash.additional_information).to eq('extra info')
      expect(verification_request_from_hash.isv_reseller).to eq('My ISV')
      expect(verification_request_from_hash.privacy_policy_url).to eq('https://example.com/privacy')
      expect(verification_request_from_hash.terms_and_conditions_url).to eq('https://example.com/terms')
      expect(verification_request_from_hash.business_dba).to eq('Bandwidth Inc')
      expect(verification_request_from_hash.business_registration_number).to eq('12-3456789')
      expect(verification_request_from_hash.business_registration_type).to eq(Bandwidth::BusinessRegistrationTypeEnum::EIN)
      expect(verification_request_from_hash.business_registration_issuing_country).to eq('USA')
      expect(verification_request_from_hash.business_entity_type).to eq(Bandwidth::BusinessEntityTypeEnum::PRIVATE_PROFIT)
      expect(verification_request_from_hash.help_message_response).to eq('For help reply with HELP')
      expect(verification_request_from_hash.age_gated_content).to eq(false)
      expect(verification_request_from_hash.cv_token).to eq('cv_token_value')
    end
  end

  describe '#to_s' do
    it 'returns a string representation of the object' do
      expect(verification_request_values.to_s).to eq('{:businessAddress=>{:name=>"Bandwidth"}, :businessContact=>{:firstName=>"Jane"}, :messageVolume=>1000, :phoneNumbers=>["+18005554321"], :useCase=>"Customer notifications", :useCaseSummary=>"Send customers updates about their orders", :productionMessageContent=>"Your order has shipped", :optInWorkflow=>{:description=>"opt-in via website", :imageUrls=>["https://example.com/optin.png"]}, :additionalInformation=>"extra info", :isvReseller=>"My ISV", :privacyPolicyUrl=>"https://example.com/privacy", :termsAndConditionsUrl=>"https://example.com/terms", :businessDba=>"Bandwidth Inc", :businessRegistrationNumber=>"12-3456789", :businessRegistrationType=>"EIN", :businessRegistrationIssuingCountry=>"USA", :businessEntityType=>"PRIVATE_PROFIT", :helpMessageResponse=>"For help reply with HELP", :ageGatedContent=>false, :cvToken=>"cv_token_value"}')
    end
  end

  describe '#eq? #==' do
    it 'returns true/false when comparing objects' do
      verification_request_equal = Bandwidth::VerificationRequest.new({
        business_address: { name: 'Bandwidth' },
        business_contact: { firstName: 'Jane' },
        message_volume: 100,
        phone_numbers: ['+18005550100'],
        use_case: 'baseline use case',
        use_case_summary: 'baseline summary',
        production_message_content: 'baseline message',
        opt_in_workflow: { description: 'baseline opt-in', imageUrls: [] },
        business_entity_type: Bandwidth::BusinessEntityTypeEnum::PRIVATE_PROFIT
      })
      expect(verification_request_default.eql?(verification_request_equal)).to be true
      expect(verification_request_default.eql?(verification_request_values)).to be false
    end
  end

  describe '#to_body #to_hash' do
    it 'returns a hash representation of the object' do
      expect(verification_request_values.to_body).to eq({
        businessAddress: { name: 'Bandwidth' },
        businessContact: { firstName: 'Jane' },
        messageVolume: 1000,
        phoneNumbers: ['+18005554321'],
        useCase: 'Customer notifications',
        useCaseSummary: 'Send customers updates about their orders',
        productionMessageContent: 'Your order has shipped',
        optInWorkflow: { description: 'opt-in via website', imageUrls: ['https://example.com/optin.png'] },
        additionalInformation: 'extra info',
        isvReseller: 'My ISV',
        privacyPolicyUrl: 'https://example.com/privacy',
        termsAndConditionsUrl: 'https://example.com/terms',
        businessDba: 'Bandwidth Inc',
        businessRegistrationNumber: '12-3456789',
        businessRegistrationType: Bandwidth::BusinessRegistrationTypeEnum::EIN,
        businessRegistrationIssuingCountry: 'USA',
        businessEntityType: Bandwidth::BusinessEntityTypeEnum::PRIVATE_PROFIT,
        helpMessageResponse: 'For help reply with HELP',
        ageGatedContent: false,
        cvToken: 'cv_token_value'
      })
    end
  end

  describe 'custom attribute writers' do
    it '#business_address=' do
      expect {
        verification_request_values.business_address = nil
      }.to raise_error(ArgumentError, 'business_address cannot be nil')
    end

    it '#business_contact=' do
      expect {
        verification_request_values.business_contact = nil
      }.to raise_error(ArgumentError, 'business_contact cannot be nil')
    end

    it '#message_volume=' do
      expect {
        verification_request_values.message_volume = nil
      }.to raise_error(ArgumentError, 'message_volume cannot be nil')

      expect {
        verification_request_values.message_volume = 10000001
      }.to raise_error(ArgumentError, 'invalid value for "message_volume", must be smaller than or equal to 10000000.')

      expect {
        verification_request_values.message_volume = 9
      }.to raise_error(ArgumentError, 'invalid value for "message_volume", must be greater than or equal to 10.')
    end

    it '#phone_numbers=' do
      expect {
        verification_request_values.phone_numbers = nil
      }.to raise_error(ArgumentError, 'phone_numbers cannot be nil')

      expect {
        verification_request_values.phone_numbers = Array.new(11) { '+18005551234' }
      }.to raise_error(ArgumentError, 'invalid value for "phone_numbers", number of items must be less than or equal to 10.')

      expect {
        verification_request_values.phone_numbers = []
      }.to raise_error(ArgumentError, 'invalid value for "phone_numbers", number of items must be greater than or equal to 1.')
    end

    it '#use_case=' do
      expect {
        verification_request_values.use_case = nil
      }.to raise_error(ArgumentError, 'use_case cannot be nil')

      expect {
        verification_request_values.use_case = 'a' * 501
      }.to raise_error(ArgumentError, 'invalid value for "use_case", the character length must be smaller than or equal to 500.')
    end

    it '#use_case_summary=' do
      expect {
        verification_request_values.use_case_summary = nil
      }.to raise_error(ArgumentError, 'use_case_summary cannot be nil')

      expect {
        verification_request_values.use_case_summary = 'a' * 501
      }.to raise_error(ArgumentError, 'invalid value for "use_case_summary", the character length must be smaller than or equal to 500.')
    end

    it '#production_message_content=' do
      expect {
        verification_request_values.production_message_content = nil
      }.to raise_error(ArgumentError, 'production_message_content cannot be nil')

      expect {
        verification_request_values.production_message_content = 'a' * 501
      }.to raise_error(ArgumentError, 'invalid value for "production_message_content", the character length must be smaller than or equal to 500.')
    end

    it '#opt_in_workflow=' do
      expect {
        verification_request_values.opt_in_workflow = nil
      }.to raise_error(ArgumentError, 'opt_in_workflow cannot be nil')
    end

    it '#additional_information=' do
      expect {
        verification_request_values.additional_information = 'a' * 501
      }.to raise_error(ArgumentError, 'invalid value for "additional_information", the character length must be smaller than or equal to 500.')
    end

    it '#isv_reseller=' do
      expect {
        verification_request_values.isv_reseller = 'a' * 501
      }.to raise_error(ArgumentError, 'invalid value for "isv_reseller", the character length must be smaller than or equal to 500.')
    end

    it '#privacy_policy_url=' do
      expect {
        verification_request_values.privacy_policy_url = nil
      }.to raise_error(ArgumentError, 'privacy_policy_url cannot be nil')

      expect {
        verification_request_values.privacy_policy_url = 'a' * 501
      }.to raise_error(ArgumentError, 'invalid value for "privacy_policy_url", the character length must be smaller than or equal to 500.')
    end

    it '#terms_and_conditions_url=' do
      expect {
        verification_request_values.terms_and_conditions_url = nil
      }.to raise_error(ArgumentError, 'terms_and_conditions_url cannot be nil')

      expect {
        verification_request_values.terms_and_conditions_url = 'a' * 501
      }.to raise_error(ArgumentError, 'invalid value for "terms_and_conditions_url", the character length must be smaller than or equal to 500.')
    end

    it '#business_dba=' do
      expect {
        verification_request_values.business_dba = nil
      }.to raise_error(ArgumentError, 'business_dba cannot be nil')

      expect {
        verification_request_values.business_dba = 'a' * 501
      }.to raise_error(ArgumentError, 'invalid value for "business_dba", the character length must be smaller than or equal to 500.')
    end

    it '#business_registration_number=' do
      expect {
        verification_request_values.business_registration_number = 'a' * 501
      }.to raise_error(ArgumentError, 'invalid value for "business_registration_number", the character length must be smaller than or equal to 500.')
    end

    it '#business_entity_type=' do
      expect {
        verification_request_values.business_entity_type = nil
      }.to raise_error(ArgumentError, 'business_entity_type cannot be nil')
    end

    it '#help_message_response=' do
      expect {
        verification_request_values.help_message_response = 'a' * 501
      }.to raise_error(ArgumentError, 'invalid value for "help_message_response", the character length must be smaller than or equal to 500.')
    end

    it '#cv_token=' do
      expect {
        verification_request_values.cv_token = 'a' * 501
      }.to raise_error(ArgumentError, 'invalid value for "cv_token", the character length must be smaller than or equal to 500.')
    end
  end
end
