# Unit tests for Bandwidth::MessageDirectionEnum
describe Bandwidth::MessageDirectionEnum do
  let(:instance) { Bandwidth::MessageDirectionEnum.new }

  describe 'test an instance of MessageDirectionEnum' do
    it 'should create an instance of MessageDirectionEnum' do
      expect(instance).to be_instance_of(Bandwidth::MessageDirectionEnum)
    end

    it 'raises an error for an invalid enum value' do
      expect {
        Bandwidth::MessageDirectionEnum.build_from_hash('invalid')
      }.to raise_error { |e|
        expect(e).to be_instance_of(RuntimeError)
      }
    end
  end
end
