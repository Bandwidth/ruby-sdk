# Unit tests for Bandwidth::MessageTypeEnum
describe Bandwidth::MessageTypeEnum do
  let(:instance) { Bandwidth::MessageTypeEnum.new }

  describe 'test an instance of MessageTypeEnum' do
    it 'should create an instance of MessageTypeEnum' do
      expect(instance).to be_instance_of(Bandwidth::MessageTypeEnum)
    end

    it 'raises an error for an invalid enum value' do
      expect {
        Bandwidth::MessageTypeEnum.build_from_hash('invalid')
      }.to raise_error { |e|
        expect(e).to be_instance_of(RuntimeError)
      }
    end
  end
end
