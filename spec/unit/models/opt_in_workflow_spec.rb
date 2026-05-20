# Unit tests for Bandwidth::OptInWorkflow
describe Bandwidth::OptInWorkflow do
  let(:opt_in_workflow_default) { Bandwidth::OptInWorkflow.new({
    description: 'baseline description',
    image_urls: ['https://example.com/baseline.png']
  }) }
  let(:opt_in_workflow_values) { Bandwidth::OptInWorkflow.new({
    description: 'A description of the opt in workflow',
    image_urls: ['https://example.com/image1.png', 'https://example.com/image2.png'],
    confirmation_response: 'Thanks for opting in!'
  }) }

  describe '#initialize' do
    it 'causes an ArgumentError by passing an Array to the initialize method' do
      expect {
        Bandwidth::OptInWorkflow.new([])
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError by passing an invalid attribute to the initialize method' do
      expect {
        Bandwidth::OptInWorkflow.new({ invalid: true })
      }.to raise_error(ArgumentError)
    end
  end

  describe '#acceptable_attributes' do
    it 'expects acceptable JSON attributes to be those in the attribute map' do
      expect(Bandwidth::OptInWorkflow.acceptable_attributes).to eq(Bandwidth::OptInWorkflow.attribute_map.values)
    end
  end

  describe '#openapi_nullable' do
    it 'expects nullable attributes to be the set of nullable fields' do
      expect(Bandwidth::OptInWorkflow.openapi_nullable).to eq(Set.new([:'confirmation_response']))
    end
  end

  describe '#build_from_hash' do
    it 'validates instance of OptInWorkflow created by the build_from_hash method' do
      opt_in_workflow_from_hash = Bandwidth::OptInWorkflow.build_from_hash({
        description: 'A description of the opt in workflow',
        imageUrls: ['https://example.com/image1.png', 'https://example.com/image2.png'],
        confirmationResponse: 'Thanks for opting in!'
      })
      expect(opt_in_workflow_from_hash).to be_instance_of(Bandwidth::OptInWorkflow)
      expect(opt_in_workflow_from_hash.description).to eq('A description of the opt in workflow')
      expect(opt_in_workflow_from_hash.image_urls).to eq(['https://example.com/image1.png', 'https://example.com/image2.png'])
      expect(opt_in_workflow_from_hash.confirmation_response).to eq('Thanks for opting in!')
    end
  end

  describe '#to_s' do
    it 'returns a string representation of the object' do
      expect(opt_in_workflow_values.to_s).to eq('{:description=>"A description of the opt in workflow", :imageUrls=>["https://example.com/image1.png", "https://example.com/image2.png"], :confirmationResponse=>"Thanks for opting in!"}')
    end
  end

  describe '#eq? #==' do
    it 'returns true/false when comparing objects' do
      opt_in_workflow_equal = Bandwidth::OptInWorkflow.new({
        description: 'baseline description',
        image_urls: ['https://example.com/baseline.png']
      })
      expect(opt_in_workflow_default.eql?(opt_in_workflow_equal)).to be true
      expect(opt_in_workflow_default.eql?(opt_in_workflow_values)).to be false
    end
  end

  describe '#to_body #to_hash' do
    it 'returns a hash representation of the object' do
      expect(opt_in_workflow_values.to_body).to eq({
        description: 'A description of the opt in workflow',
        imageUrls: ['https://example.com/image1.png', 'https://example.com/image2.png'],
        confirmationResponse: 'Thanks for opting in!'
      })
    end
  end

  describe 'custom attribute writers' do
    it '#description=' do
      expect {
        Bandwidth::OptInWorkflow.new({ description: nil })
      }.to raise_error(ArgumentError, 'description cannot be nil')

      expect {
        Bandwidth::OptInWorkflow.new({ description: 'a' * 501 })
      }.to raise_error(ArgumentError, 'invalid value for "description", the character length must be smaller than or equal to 500.')

      expect {
        Bandwidth::OptInWorkflow.new({ description: '' })
      }.to raise_error(ArgumentError, 'invalid value for "description", the character length must be greater than or equal to 1.')
    end

    it '#image_urls=' do
      expect {
        Bandwidth::OptInWorkflow.new({ description: 'a' })
      }.to raise_error(ArgumentError, 'image_urls cannot be nil')

      expect {
        opt_in_workflow_values.image_urls = nil
      }.to raise_error(ArgumentError, 'image_urls cannot be nil')
    end

    it '#confirmation_response=' do
      expect {
        opt_in_workflow_values.confirmation_response = 'a' * 501
      }.to raise_error(ArgumentError, 'invalid value for "confirmation_response", the character length must be smaller than or equal to 500.')
    end
  end
end
