# Unit tests for Bandwidth::FileFormatEnum
describe Bandwidth::FileFormatEnum do
  let(:instance) { Bandwidth::FileFormatEnum.new }

  describe 'test an instance of FileFormatEnum' do
    it 'creates an instance of FileFormatEnum' do
      expect(instance).to be_instance_of(Bandwidth::FileFormatEnum)
    end

    it 'raises an error for an invalid enum value' do
      expect {
        Bandwidth::FileFormatEnum.build_from_hash('invalid')
      }.to raise_error { |e|
        expect(e).to be_instance_of(RuntimeError)
      }
    end
  end
end
