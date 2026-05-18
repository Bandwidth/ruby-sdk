# Unit tests for Bandwidth::RbmActionOpenUrl
describe Bandwidth::RbmActionOpenUrl do
  let(:rbm_action_open_url_default) { Bandwidth::RbmActionOpenUrl.new({
    type: Bandwidth::RbmActionTypeEnum::OPEN_URL,
    text: 'baseline',
    postback_data: 'baseline_postback',
    url: 'https://example.com/baseline'
  }) }
  let(:rbm_action_open_url_values) { Bandwidth::RbmActionOpenUrl.new({
    type: Bandwidth::RbmActionTypeEnum::OPEN_URL,
    text: 'Open URL',
    postback_data: 'open_url_postback',
    url: 'https://example.com',
    application: Bandwidth::RbmOpenUrlEnum::BROWSER,
    webview_view_mode: Bandwidth::RbmWebViewEnum::FULL
  }) }

  describe '#initialize' do
    it 'causes an ArgumentError by passing an Array to the initialize method' do
      expect {
        Bandwidth::RbmActionOpenUrl.new([])
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError by passing an invalid attribute to the initialize method' do
      expect {
        Bandwidth::RbmActionOpenUrl.new({ invalid: true })
      }.to raise_error(ArgumentError)
    end
  end

  describe '#acceptable_attributes' do
    it 'expects acceptable JSON attributes to be those in the attribute map' do
      expect(Bandwidth::RbmActionOpenUrl.acceptable_attributes).to eq(Bandwidth::RbmActionOpenUrl.attribute_map.values)
    end
  end

  describe '#openapi_nullable' do
    it 'expects nullable attributes to be an empty set' do
      expect(Bandwidth::RbmActionOpenUrl.openapi_nullable).to eq(Set.new([]))
    end
  end

  describe '#build_from_hash' do
    it 'validates instance of RbmActionOpenUrl created by the build_from_hash method' do
      rbm_action_open_url_from_hash = Bandwidth::RbmActionOpenUrl.build_from_hash({
        type: Bandwidth::RbmActionTypeEnum::OPEN_URL,
        text: 'Open URL',
        postbackData: 'open_url_postback',
        url: 'https://example.com',
        application: Bandwidth::RbmOpenUrlEnum::BROWSER,
        webviewViewMode: Bandwidth::RbmWebViewEnum::FULL
      })
      expect(rbm_action_open_url_from_hash).to be_instance_of(Bandwidth::RbmActionOpenUrl)
      expect(rbm_action_open_url_from_hash.type).to eq(Bandwidth::RbmActionTypeEnum::OPEN_URL)
      expect(rbm_action_open_url_from_hash.text).to eq('Open URL')
      expect(rbm_action_open_url_from_hash.postback_data).to eq('open_url_postback')
      expect(rbm_action_open_url_from_hash.url).to eq('https://example.com')
      expect(rbm_action_open_url_from_hash.application).to eq(Bandwidth::RbmOpenUrlEnum::BROWSER)
      expect(rbm_action_open_url_from_hash.webview_view_mode).to eq(Bandwidth::RbmWebViewEnum::FULL)
    end
  end

  describe '#to_s' do
    it 'returns a string representation of the object' do
      expect(rbm_action_open_url_values.to_s).to eq('{:type=>"OPEN_URL", :text=>"Open URL", :postbackData=>"open_url_postback", :url=>"https://example.com", :application=>"BROWSER", :webviewViewMode=>"FULL"}')
    end
  end

  describe '#eq? #==' do
    it 'returns true/false when comparing objects' do
      rbm_action_open_url_equal = Bandwidth::RbmActionOpenUrl.new({
        type: Bandwidth::RbmActionTypeEnum::OPEN_URL,
        text: 'baseline',
        postback_data: 'baseline_postback',
        url: 'https://example.com/baseline'
      })
      expect(rbm_action_open_url_default.eql?(rbm_action_open_url_equal)).to be true
      expect(rbm_action_open_url_default.eql?(rbm_action_open_url_values)).to be false
    end
  end

  describe '#to_body #to_hash' do
    it 'returns a hash representation of the object' do
      expect(rbm_action_open_url_values.to_body).to eq({
        type: Bandwidth::RbmActionTypeEnum::OPEN_URL,
        text: 'Open URL',
        postbackData: 'open_url_postback',
        url: 'https://example.com',
        application: Bandwidth::RbmOpenUrlEnum::BROWSER,
        webviewViewMode: Bandwidth::RbmWebViewEnum::FULL
      })
    end
  end

  describe 'custom attribute writers' do
    it '#type=' do
      expect {
        Bandwidth::RbmActionOpenUrl.new({ type: nil })
      }.to raise_error(ArgumentError, 'type cannot be nil')
    end

    it '#text=' do
      expect {
        Bandwidth::RbmActionOpenUrl.new({ type: 'OPEN_URL', text: nil })
      }.to raise_error(ArgumentError, 'text cannot be nil')

      expect {
        Bandwidth::RbmActionOpenUrl.new({ type: 'OPEN_URL', text: 'a' * 26 })
      }.to raise_error(ArgumentError, 'invalid value for "text", the character length must be smaller than or equal to 25.')
    end

    it '#postback_data=' do
      expect {
        Bandwidth::RbmActionOpenUrl.new({ type: 'OPEN_URL', text: 'a', postback_data: nil })
      }.to raise_error(ArgumentError, 'postback_data cannot be nil')

      expect {
        Bandwidth::RbmActionOpenUrl.new({ type: 'OPEN_URL', text: 'a', postback_data: 'a' * 2049 })
      }.to raise_error(ArgumentError, 'invalid value for "postback_data", the character length must be smaller than or equal to 2048.')
    end

    it '#url=' do
      expect {
        Bandwidth::RbmActionOpenUrl.new({ type: 'OPEN_URL', text: 'a', postback_data: 'a', url: nil })
      }.to raise_error(ArgumentError, 'url cannot be nil')

      expect {
        Bandwidth::RbmActionOpenUrl.new({ type: 'OPEN_URL', text: 'a', postback_data: 'a', url: 'a' * 2049 })
      }.to raise_error(ArgumentError, 'invalid value for "url", the character length must be smaller than or equal to 2048.')
    end
  end
end
