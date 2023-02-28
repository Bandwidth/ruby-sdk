require 'spec_helper'

# Unit tests for Bandwidth::Bxml::NestableVerb
describe 'Bandwidth::Bxml::NestableVerb' do
  let(:instance) { Class.new.include(Bandwidth::Bxml::NestableVerb).new('Test') }
  
  describe 'test an instance of TerminalVerb' do
    it 'validates instance of TerminalVerb' do
      expect(instance).to be_a(Bandwidth::Bxml::NestableVerb)
      expect(instance).to be_a(Bandwidth::Bxml::Verb)
    end
  end
end
