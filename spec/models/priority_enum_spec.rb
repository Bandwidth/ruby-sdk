# Unit tests for Bandwidth::PriorityEnum
describe Bandwidth::PriorityEnum do
  let(:instance) { Bandwidth::PriorityEnum.new }

  describe 'test an instance of PriorityEnum' do
    it 'creates an instance of PriorityEnum' do
      expect(instance).to be_instance_of(Bandwidth::PriorityEnum)
    end

    it 'raises an error for an invalid enum value' do
      expect {
        Bandwidth::PriorityEnum.build_from_hash('invalid')
      }.to raise_error { |e|
        expect(e).to be_instance_of(RuntimeError)
      }
    end
  end
end
