# Unit tests for Bandwidth::RedirectMethodEnum
describe Bandwidth::RedirectMethodEnum do
  let(:instance) { Bandwidth::RedirectMethodEnum.new }

  describe 'test an instance of RedirectMethodEnum' do
    it 'creates an instance of RedirectMethodEnum' do
      expect(instance).to be_instance_of(Bandwidth::RedirectMethodEnum)
    end

    it 'raises an error for an invalid enum value' do
      expect {
        Bandwidth::RedirectMethodEnum.build_from_hash('invalid')
      }.to raise_error { |e|
        expect(e).to be_instance_of(RuntimeError)
      }
    end
  end
end
