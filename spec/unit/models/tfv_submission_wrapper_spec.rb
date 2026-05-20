# Unit tests for Bandwidth::TfvSubmissionWrapper
describe Bandwidth::TfvSubmissionWrapper do
  let(:tfv_submission_wrapper_default) { Bandwidth::TfvSubmissionWrapper.new }
  let(:tfv_submission_wrapper_values) { Bandwidth::TfvSubmissionWrapper.new({
    submission: { businessDba: 'Bandwidth Inc' }
  }) }

  describe '#initialize' do
    it 'causes an ArgumentError by passing an Array to the initialize method' do
      expect {
        Bandwidth::TfvSubmissionWrapper.new([])
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError by passing an invalid attribute to the initialize method' do
      expect {
        Bandwidth::TfvSubmissionWrapper.new({ invalid: true })
      }.to raise_error(ArgumentError)
    end
  end

  describe '#acceptable_attributes' do
    it 'expects acceptable JSON attributes to be those in the attribute map' do
      expect(Bandwidth::TfvSubmissionWrapper.acceptable_attributes).to eq(Bandwidth::TfvSubmissionWrapper.attribute_map.values)
    end
  end

  describe '#openapi_nullable' do
    it 'expects nullable attributes to be an empty set' do
      expect(Bandwidth::TfvSubmissionWrapper.openapi_nullable).to eq(Set.new([]))
    end
  end

  describe '#build_from_hash' do
    it 'validates instance of TfvSubmissionWrapper created by the build_from_hash method' do
      tfv_submission_wrapper_from_hash = Bandwidth::TfvSubmissionWrapper.build_from_hash({
        submission: {
          businessAddress: { name: 'Bandwidth', addr1: '900 Main Campus Dr', city: 'Raleigh', state: 'NC', zip: '27606', url: 'https://www.bandwidth.com' },
          businessContact: { firstName: 'Jane', lastName: 'Doe', email: 'jane@bandwidth.com', phoneNumber: '+19195551234' },
          messageVolume: 1000,
          useCase: 'Customer notifications',
          useCaseSummary: 'Send customers updates about their orders',
          productionMessageContent: 'Your order has shipped',
          optInWorkflow: { description: 'opt-in via website', imageUrls: ['https://example.com/optin.png'] },
          privacyPolicyUrl: 'https://example.com/privacy',
          termsAndConditionsUrl: 'https://example.com/terms',
          businessDba: 'Bandwidth Inc'
        }
      })
      expect(tfv_submission_wrapper_from_hash).to be_instance_of(Bandwidth::TfvSubmissionWrapper)
      expect(tfv_submission_wrapper_from_hash.submission).to be_instance_of(Bandwidth::VerificationUpdateRequest)
      expect(tfv_submission_wrapper_from_hash.submission.business_dba).to eq('Bandwidth Inc')
    end
  end

  describe '#to_s' do
    it 'returns a string representation of the object' do
      expect(tfv_submission_wrapper_values.to_s).to eq('{:submission=>{:businessDba=>"Bandwidth Inc"}}')
    end
  end

  describe '#eq? #==' do
    it 'returns true/false when comparing objects' do
      expect(tfv_submission_wrapper_default.eql?(Bandwidth::TfvSubmissionWrapper.new)).to be true
      expect(tfv_submission_wrapper_default.eql?(tfv_submission_wrapper_values)).to be false
    end
  end

  describe '#to_body #to_hash' do
    it 'returns a hash representation of the object' do
      expect(tfv_submission_wrapper_values.to_body).to eq({
        submission: { businessDba: 'Bandwidth Inc' }
      })
    end
  end
end
