# Unit tests for Bandwidth::Bxml::NestableVerb
describe 'Bandwidth::Bxml::NestableVerb' do
  let(:instance) { Bandwidth::Bxml::NestableVerb.new('Test') }
  
  describe 'test an instance of NestableVerb' do
    it 'validates instance of NestableVerb' do
      expect(instance).to be_a(Bandwidth::Bxml::NestableVerb)
      expect(instance).to be_a(Bandwidth::Bxml::Verb)
    end
  end
end
