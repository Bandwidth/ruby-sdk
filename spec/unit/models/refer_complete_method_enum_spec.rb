describe Bandwidth::ReferCompleteMethodEnum do
  it 'defines GET and POST' do
    expect(Bandwidth::ReferCompleteMethodEnum::GET).to eq('GET')
    expect(Bandwidth::ReferCompleteMethodEnum::POST).to eq('POST')
  end

  it 'returns all vars' do
    expect(Bandwidth::ReferCompleteMethodEnum.all_vars).to eq(['GET', 'POST'])
  end

  it 'builds from valid hash values' do
    expect(Bandwidth::ReferCompleteMethodEnum.build_from_hash('GET')).to eq('GET')
    expect(Bandwidth::ReferCompleteMethodEnum.build_from_hash('POST')).to eq('POST')
  end

  it 'raises for invalid values' do
    expect { Bandwidth::ReferCompleteMethodEnum.build_from_hash('PUT') }.to raise_error(RuntimeError)
  end
end