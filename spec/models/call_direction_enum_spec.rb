# Unit tests for Bandwidth::CallDirectionEnum
describe Bandwidth::CallDirectionEnum do
  let(:instance) { Bandwidth::CallDirectionEnum.new }

  describe 'test an instance of CallDirectionEnum' do
    it 'creates an instance of CallDirectionEnum' do
      expect(instance).to be_instance_of(Bandwidth::CallDirectionEnum)
    end

    it 'raises an error for an invalid enum value' do
      expect {
        Bandwidth::CallDirectionEnum.build_from_hash('invalid')
      }.to raise_error { |e|
        expect(e).to be_instance_of(RuntimeError)
      }
    end
  end
end
