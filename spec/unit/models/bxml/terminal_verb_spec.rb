require 'spec_helper'

# Unit tests for Bandwidth::Bxml::TerminalVerb
describe 'Bandwidth::Bxml::Verb' do
  let(:instance) { Class.new.include(Bandwidth::Bxml::TerminalVerb).new('Test') }
  
  describe 'test an instance of TerminalVerb' do
    it 'validates instance of TerminalVerb' do
      expect(instance).to be_a(Bandwidth::Bxml::TerminalVerb)
    end

    it 'tests invalid nested verb' do       
      expect {
        instance.add_verb('invalid')
      }.to raise_error { |e|
        expect(e).to be_a(NameError)
      }
    end
  end
end
