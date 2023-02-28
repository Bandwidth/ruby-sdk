require 'spec_helper'

# Unit tests for Bandwidth::Bxml::TerminalVerb
describe 'Bandwidth::Bxml::Verb' do
  let(:instance) { Class.new.include(Bandwidth::Bxml::TerminalVerb).new('Test') }
  
  describe 'test an instance of TerminalVerb' do
    it 'validates instance of TerminalVerb' do
      expect(instance).to be_a(Bandwidth::Bxml::TerminalVerb)
      expect(instance).to be_a(Bandwidth::Bxml::Verb)
    end
  end
end
