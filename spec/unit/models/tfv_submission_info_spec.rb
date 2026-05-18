# Unit tests for Bandwidth::TfvSubmissionInfo
describe Bandwidth::TfvSubmissionInfo do
  let(:tfv_submission_info_default) { Bandwidth::TfvSubmissionInfo.new }
  let(:tfv_submission_info_values) { Bandwidth::TfvSubmissionInfo.new({
    business_address: { name: 'Bandwidth' },
    business_contact: { firstName: 'Jane' },
    message_volume: 1000,
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
    business_entity_type: Bandwidth::BusinessEntityTypeEnum::PRIVATE_PROFIT
  }) }

  describe '#initialize' do
    it 'causes an ArgumentError by passing an Array to the initialize method' do
      expect {
        Bandwidth::TfvSubmissionInfo.new([])
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError by passing an invalid attribute to the initialize method' do
      expect {
        Bandwidth::TfvSubmissionInfo.new({ invalid: true })
      }.to raise_error(ArgumentError)
    end
  end

  describe '#acceptable_attributes' do
    it 'expects acceptable JSON attributes to be those in the attribute map' do
      expect(Bandwidth::TfvSubmissionInfo.acceptable_attributes).to eq(Bandwidth::TfvSubmissionInfo.attribute_map.values)
    end
  end

  describe '#openapi_nullable' do
    it 'expects nullable attributes to be the set of nullable fields' do
      expect(Bandwidth::TfvSubmissionInfo.openapi_nullable).to eq(Set.new([
        :'additional_information',
        :'isv_reseller',
        :'business_registration_number',
        :'business_registration_type',
        :'business_registration_issuing_country'
      ]))
    end
  end

  describe '#build_from_hash' do
    it 'validates instance of TfvSubmissionInfo created by the build_from_hash method' do
      tfv_submission_info_from_hash = Bandwidth::TfvSubmissionInfo.build_from_hash({
        businessAddress: { name: 'Bandwidth', addr1: '900 Main Campus Dr', city: 'Raleigh', state: 'NC', zip: '27606', url: 'https://www.bandwidth.com' },
        businessContact: { firstName: 'Jane', lastName: 'Doe', email: 'jane@bandwidth.com', phoneNumber: '+19195551234' },
        messageVolume: 1000,
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
        businessEntityType: Bandwidth::BusinessEntityTypeEnum::PRIVATE_PROFIT
      })
      expect(tfv_submission_info_from_hash).to be_instance_of(Bandwidth::TfvSubmissionInfo)
      expect(tfv_submission_info_from_hash.business_address).to be_instance_of(Bandwidth::Address)
      expect(tfv_submission_info_from_hash.business_contact).to be_instance_of(Bandwidth::Contact)
      expect(tfv_submission_info_from_hash.message_volume).to eq(1000)
      expect(tfv_submission_info_from_hash.use_case).to eq('Customer notifications')
      expect(tfv_submission_info_from_hash.use_case_summary).to eq('Send customers updates about their orders')
      expect(tfv_submission_info_from_hash.production_message_content).to eq('Your order has shipped')
      expect(tfv_submission_info_from_hash.opt_in_workflow).to be_instance_of(Bandwidth::OptInWorkflow)
      expect(tfv_submission_info_from_hash.additional_information).to eq('extra info')
      expect(tfv_submission_info_from_hash.isv_reseller).to eq('My ISV')
      expect(tfv_submission_info_from_hash.privacy_policy_url).to eq('https://example.com/privacy')
      expect(tfv_submission_info_from_hash.terms_and_conditions_url).to eq('https://example.com/terms')
      expect(tfv_submission_info_from_hash.business_dba).to eq('Bandwidth Inc')
      expect(tfv_submission_info_from_hash.business_registration_number).to eq('12-3456789')
      expect(tfv_submission_info_from_hash.business_registration_type).to eq(Bandwidth::BusinessRegistrationTypeEnum::EIN)
      expect(tfv_submission_info_from_hash.business_registration_issuing_country).to eq('USA')
      expect(tfv_submission_info_from_hash.business_entity_type).to eq(Bandwidth::BusinessEntityTypeEnum::PRIVATE_PROFIT)
    end
  end

  describe '#to_s' do
    it 'returns a string representation of the object' do
      expect(tfv_submission_info_values.to_s).to eq('{:businessAddress=>{:name=>"Bandwidth"}, :businessContact=>{:firstName=>"Jane"}, :messageVolume=>1000, :useCase=>"Customer notifications", :useCaseSummary=>"Send customers updates about their orders", :productionMessageContent=>"Your order has shipped", :optInWorkflow=>{:description=>"opt-in via website", :imageUrls=>["https://example.com/optin.png"]}, :additionalInformation=>"extra info", :isvReseller=>"My ISV", :privacyPolicyUrl=>"https://example.com/privacy", :termsAndConditionsUrl=>"https://example.com/terms", :businessDba=>"Bandwidth Inc", :businessRegistrationNumber=>"12-3456789", :businessRegistrationType=>"EIN", :businessRegistrationIssuingCountry=>"USA", :businessEntityType=>"PRIVATE_PROFIT"}')
    end
  end

  describe '#eq? #==' do
    it 'returns true/false when comparing objects' do
      expect(tfv_submission_info_default.eql?(Bandwidth::TfvSubmissionInfo.new)).to be true
      expect(tfv_submission_info_default.eql?(tfv_submission_info_values)).to be false
    end
  end

  describe '#to_body #to_hash' do
    it 'returns a hash representation of the object' do
      expect(tfv_submission_info_values.to_body).to eq({
        businessAddress: { name: 'Bandwidth' },
        businessContact: { firstName: 'Jane' },
        messageVolume: 1000,
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
        businessEntityType: Bandwidth::BusinessEntityTypeEnum::PRIVATE_PROFIT
      })
    end
  end

  describe 'custom attribute writers' do
    it '#message_volume=' do
      expect {
        Bandwidth::TfvSubmissionInfo.new({ message_volume: nil })
      }.to raise_error(ArgumentError, 'message_volume cannot be nil')

      expect {
        Bandwidth::TfvSubmissionInfo.new({ message_volume: 10000001 })
      }.to raise_error(ArgumentError, 'invalid value for "message_volume", must be smaller than or equal to 10000000.')

      expect {
        Bandwidth::TfvSubmissionInfo.new({ message_volume: 9 })
      }.to raise_error(ArgumentError, 'invalid value for "message_volume", must be greater than or equal to 10.')
    end

    it '#use_case=' do
      expect {
        Bandwidth::TfvSubmissionInfo.new({ use_case: nil })
      }.to raise_error(ArgumentError, 'use_case cannot be nil')

      expect {
        Bandwidth::TfvSubmissionInfo.new({ use_case: 'a' * 501 })
      }.to raise_error(ArgumentError, 'invalid value for "use_case", the character length must be smaller than or equal to 500.')
    end

    it '#use_case_summary=' do
      expect {
        Bandwidth::TfvSubmissionInfo.new({ use_case_summary: nil })
      }.to raise_error(ArgumentError, 'use_case_summary cannot be nil')

      expect {
        Bandwidth::TfvSubmissionInfo.new({ use_case_summary: 'a' * 501 })
      }.to raise_error(ArgumentError, 'invalid value for "use_case_summary", the character length must be smaller than or equal to 500.')
    end

    it '#production_message_content=' do
      expect {
        Bandwidth::TfvSubmissionInfo.new({ production_message_content: nil })
      }.to raise_error(ArgumentError, 'production_message_content cannot be nil')

      expect {
        Bandwidth::TfvSubmissionInfo.new({ production_message_content: 'a' * 501 })
      }.to raise_error(ArgumentError, 'invalid value for "production_message_content", the character length must be smaller than or equal to 500.')
    end

    it '#additional_information=' do
      expect {
        Bandwidth::TfvSubmissionInfo.new({ additional_information: 'a' * 501 })
      }.to raise_error(ArgumentError, 'invalid value for "additional_information", the character length must be smaller than or equal to 500.')
    end

    it '#isv_reseller=' do
      expect {
        Bandwidth::TfvSubmissionInfo.new({ isv_reseller: 'a' * 501 })
      }.to raise_error(ArgumentError, 'invalid value for "isv_reseller", the character length must be smaller than or equal to 500.')
    end

    it '#privacy_policy_url=' do
      expect {
        Bandwidth::TfvSubmissionInfo.new({ privacy_policy_url: nil })
      }.to raise_error(ArgumentError, 'privacy_policy_url cannot be nil')

      expect {
        Bandwidth::TfvSubmissionInfo.new({ privacy_policy_url: 'a' * 501 })
      }.to raise_error(ArgumentError, 'invalid value for "privacy_policy_url", the character length must be smaller than or equal to 500.')
    end

    it '#terms_and_conditions_url=' do
      expect {
        Bandwidth::TfvSubmissionInfo.new({ terms_and_conditions_url: nil })
      }.to raise_error(ArgumentError, 'terms_and_conditions_url cannot be nil')

      expect {
        Bandwidth::TfvSubmissionInfo.new({ terms_and_conditions_url: 'a' * 501 })
      }.to raise_error(ArgumentError, 'invalid value for "terms_and_conditions_url", the character length must be smaller than or equal to 500.')
    end

    it '#business_dba=' do
      expect {
        Bandwidth::TfvSubmissionInfo.new({ business_dba: nil })
      }.to raise_error(ArgumentError, 'business_dba cannot be nil')

      expect {
        Bandwidth::TfvSubmissionInfo.new({ business_dba: 'a' * 501 })
      }.to raise_error(ArgumentError, 'invalid value for "business_dba", the character length must be smaller than or equal to 500.')
    end

    it '#business_registration_number=' do
      expect {
        Bandwidth::TfvSubmissionInfo.new({ business_registration_number: 'a' * 501 })
      }.to raise_error(ArgumentError, 'invalid value for "business_registration_number", the character length must be smaller than or equal to 500.')
    end
  end
end
