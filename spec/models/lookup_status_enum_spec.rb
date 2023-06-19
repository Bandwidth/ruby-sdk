# Unit tests for Bandwidth::LookupStatusEnum
describe Bandwidth::LookupStatusEnum do
  let(:instance) { Bandwidth::LookupStatusEnum.new }

  describe 'test an instance of LookupStatusEnum' do
    it 'creates an instance of LookupStatusEnum' do
      expect(instance).to be_instance_of(Bandwidth::LookupStatusEnum)
    end

    it 'raises an error for an invalid enum value' do
      expect {
        Bandwidth::LookupStatusEnum.build_from_hash('invalid')
      }.to raise_error { |e|
        expect(e).to be_instance_of(RuntimeError)
      }
    end
  end
end
