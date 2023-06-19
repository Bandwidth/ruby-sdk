# Unit tests for Bandwidth::ListMessageDirectionEnum
describe Bandwidth::ListMessageDirectionEnum do
  let(:instance) { Bandwidth::ListMessageDirectionEnum.new }

  describe 'test an instance of ListMessageDirectionEnum' do
    it 'should create an instance of ListMessageDirectionEnum' do
      expect(instance).to be_instance_of(Bandwidth::ListMessageDirectionEnum)
    end

    it 'raises an error for an invalid enum value' do
      expect {
        Bandwidth::ListMessageDirectionEnum.build_from_hash('invalid')
      }.to raise_error { |e|
        expect(e).to be_instance_of(RuntimeError)
      }
    end
  end
end
