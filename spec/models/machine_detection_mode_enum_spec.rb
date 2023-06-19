# Unit tests for Bandwidth::MachineDetectionModeEnum
describe Bandwidth::MachineDetectionModeEnum do
  let(:instance) { Bandwidth::MachineDetectionModeEnum.new }

  describe 'test an instance of MachineDetectionModeEnum' do
    it 'creates an instance of MachineDetectionModeEnum' do
      expect(instance).to be_instance_of(Bandwidth::MachineDetectionModeEnum)
    end

    it 'raises an error for an invalid enum value' do
      expect {
        Bandwidth::MachineDetectionModeEnum.build_from_hash('invalid')
      }.to raise_error { |e|
        expect(e).to be_instance_of(RuntimeError)
      }
    end
  end
end
