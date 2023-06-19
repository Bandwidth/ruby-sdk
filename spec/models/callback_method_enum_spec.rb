# Unit tests for Bandwidth::CallbackMethodEnum
describe Bandwidth::CallbackMethodEnum do
  let(:instance) { Bandwidth::CallbackMethodEnum.new }

  describe 'test an instance of CallbackMethodEnum' do
    it 'should create an instance of CallbackMethodEnum' do
      expect(instance).to be_instance_of(Bandwidth::CallbackMethodEnum)
    end

    it 'raises an error for an invalid enum value' do
      expect {
        Bandwidth::CallbackMethodEnum.build_from_hash('invalid')
      }.to raise_error { |e|
        expect(e).to be_instance_of(RuntimeError)
      }
    end
  end
end
