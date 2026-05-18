# Unit tests for Bandwidth::MachineDetectionResult
describe Bandwidth::MachineDetectionResult do
  let(:machine_detection_result_default) { Bandwidth::MachineDetectionResult.new }
  let(:machine_detection_result_values) { Bandwidth::MachineDetectionResult.new({
    value: 'human',
    duration: 'PT5S'
  }) }

  describe '#initialize' do
    it 'causes an ArgumentError by passing an Array to the initialize method' do
      expect {
        Bandwidth::MachineDetectionResult.new([])
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError by passing an invalid attribute to the initialize method' do
      expect {
        Bandwidth::MachineDetectionResult.new({ invalid: true })
      }.to raise_error(ArgumentError)
    end
  end

  describe '#acceptable_attributes' do
    it 'expects acceptable JSON attributes to be those in the attribute map' do
      expect(Bandwidth::MachineDetectionResult.acceptable_attributes).to eq(Bandwidth::MachineDetectionResult.attribute_map.values)
    end
  end

  describe '#openapi_nullable' do
    it 'expects nullable attributes to be an empty set' do
      expect(Bandwidth::MachineDetectionResult.openapi_nullable).to eq(Set.new([]))
    end
  end

  describe '#build_from_hash' do
    it 'validates instance of MachineDetectionResult created by the build_from_hash method' do
      machine_detection_result_from_hash = Bandwidth::MachineDetectionResult.build_from_hash({
        value: 'human',
        duration: 'PT5S'
      })
      expect(machine_detection_result_from_hash).to be_instance_of(Bandwidth::MachineDetectionResult)
      expect(machine_detection_result_from_hash.value).to eq('human')
      expect(machine_detection_result_from_hash.duration).to eq('PT5S')
    end
  end

  describe '#to_s' do
    it 'returns a string representation of the object' do
      expect(machine_detection_result_values.to_s).to eq('{:value=>"human", :duration=>"PT5S"}')
    end
  end

  describe '#eq? #==' do
    it 'returns true/false when comparing objects' do
      expect(machine_detection_result_default.eql?(Bandwidth::MachineDetectionResult.new)).to be true
      expect(machine_detection_result_default.eql?(machine_detection_result_values)).to be false
    end
  end

  describe '#to_body #to_hash' do
    it 'returns a hash representation of the object' do
      expect(machine_detection_result_values.to_body).to eq({
        value: 'human',
        duration: 'PT5S'
      })
    end
  end
end
