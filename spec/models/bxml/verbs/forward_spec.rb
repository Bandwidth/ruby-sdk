

# Unit tests for Bandwidth::Bxml::Forward
describe 'Bandwidth::Bxml::Forward' do
  let(:initial_attributes) {
    {
      to: '+19195551234',
      from: '+19195554321',
      call_timeout: 5,
      diversion_treatment: 'propogate',
      diversion_reason: 'user-busy',
      uui: '93d6f3c0be5845960b744fa28015d8ede84bd1a4;encoding=base64,asdf;encoding=jwt'
    }
  }

  let(:new_attributes) {
    {
      to: '+19195554321',
      from: '+19195551234',
      call_timeout: 10,
      diversion_treatment: 'stack',
      diversion_reason: 'no-answer',
      uui: '4fa28015d8ede84bd1a493d6f3c0be5845960b74;encoding=base64,fdsa;encoding=jwt'
    }
  }

  let(:instance) { Bandwidth::Bxml::Forward.new(initial_attributes) }

  describe 'test an instance of Forward' do
    it 'validates instance of Forward' do
      expect(instance).to be_instance_of(Bandwidth::Bxml::Forward)
      expect(instance).to be_a(Bandwidth::Bxml::Verb)
    end

    it 'tests the to_bxml method of the Forward instance' do
      expected = "\n<Forward to=\"+19195551234\" from=\"+19195554321\" callTimeout=\"5\" diversionTreatment=\"propogate\" diversionReason=\"user-busy\" uui=\"93d6f3c0be5845960b744fa28015d8ede84bd1a4;encoding=base64,asdf;encoding=jwt\"/>\n"
      expect(instance.to_bxml).to eq(expected)
    end

    it 'tests the set_attributes method of the Forward instance' do
      instance.set_attributes(new_attributes)
      expected = "\n<Forward to=\"+19195554321\" from=\"+19195551234\" callTimeout=\"10\" diversionTreatment=\"stack\" diversionReason=\"no-answer\" uui=\"4fa28015d8ede84bd1a493d6f3c0be5845960b74;encoding=base64,fdsa;encoding=jwt\"/>\n"
      expect(instance.to_bxml).to eq(expected)
    end
  end
end
