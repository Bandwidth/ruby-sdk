# Unit tests for Bandwidth::MessageStatusEnum
describe Bandwidth::MessageStatusEnum do
  let(:instance) { Bandwidth::MessageStatusEnum.new }

  describe 'test an instance of MessageStatusEnum' do
    it 'creates an instance of MessageStatusEnum' do
      expect(instance).to be_instance_of(Bandwidth::MessageStatusEnum)
    end

    it 'raises an error for an invalid enum value' do
      expect {
        Bandwidth::MessageStatusEnum.build_from_hash('invalid')
      }.to raise_error { |e|
        expect(e).to be_instance_of(RuntimeError)
      }
    end
  end
end
