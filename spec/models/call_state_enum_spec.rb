# Unit tests for Bandwidth::CallStateEnum
describe Bandwidth::CallStateEnum do
  let(:instance) { Bandwidth::CallStateEnum.new }

  describe 'test an instance of CallStateEnum' do
    it 'should create an instance of CallStateEnum' do
      expect(instance).to be_instance_of(Bandwidth::CallStateEnum)
    end

    it 'raises an error for an invalid enum value' do
      expect {
        Bandwidth::CallStateEnum.build_from_hash('invalid')
      }.to raise_error { |e|
        expect(e).to be_instance_of(RuntimeError)
      }
    end
  end
end
