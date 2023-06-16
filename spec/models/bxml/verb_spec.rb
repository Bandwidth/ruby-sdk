

# Unit tests for Bandwidth::Bxml::Verb
describe 'Bandwidth::Bxml::Verb' do
  let(:instance) { Class.new.include(Bandwidth::Bxml::Verb).new('Test') }
  
  describe 'test an instance of Verb' do
    it 'validates instance of Verb' do
      expect(instance).to be_a(Bandwidth::Bxml::Verb)
    end

    it 'tests the to_bxml method of the Verb instance' do
      expected = "\n<Test/>\n"
      expect(instance.to_bxml).to eq(expected)
    end

    it 'tests invalid attribute' do
      attributes = {'invalid_attribute' => 'invalid'}
      instance.set_attributes(attributes)
      
      expect {
        instance.generate_xml
      }.to raise_error { |e|
        expect(e).to be_a(NoMethodError)
      }
    end
  end
end
