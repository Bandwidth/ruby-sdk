# Unit tests for Bandwidth::BusinessRegistrationTypeEnum
describe Bandwidth::BusinessRegistrationTypeEnum do
  describe 'constants' do
    it 'defines EIN' do
      expect(Bandwidth::BusinessRegistrationTypeEnum::EIN).to eq('EIN')
    end

    it 'defines CBN' do
      expect(Bandwidth::BusinessRegistrationTypeEnum::CBN).to eq('CBN')
    end

    it 'defines NEQ' do
      expect(Bandwidth::BusinessRegistrationTypeEnum::NEQ).to eq('NEQ')
    end

    it 'defines PROVINCIAL_NUMBER' do
      expect(Bandwidth::BusinessRegistrationTypeEnum::PROVINCIAL_NUMBER).to eq('PROVINCIAL_NUMBER')
    end

    it 'defines CRN' do
      expect(Bandwidth::BusinessRegistrationTypeEnum::CRN).to eq('CRN')
    end

    it 'defines VAT' do
      expect(Bandwidth::BusinessRegistrationTypeEnum::VAT).to eq('VAT')
    end

    it 'defines ACN' do
      expect(Bandwidth::BusinessRegistrationTypeEnum::ACN).to eq('ACN')
    end

    it 'defines ABN' do
      expect(Bandwidth::BusinessRegistrationTypeEnum::ABN).to eq('ABN')
    end

    it 'defines BRN' do
      expect(Bandwidth::BusinessRegistrationTypeEnum::BRN).to eq('BRN')
    end

    it 'defines SIREN' do
      expect(Bandwidth::BusinessRegistrationTypeEnum::SIREN).to eq('SIREN')
    end

    it 'defines SIRET' do
      expect(Bandwidth::BusinessRegistrationTypeEnum::SIRET).to eq('SIRET')
    end

    it 'defines NZBN' do
      expect(Bandwidth::BusinessRegistrationTypeEnum::NZBN).to eq('NZBN')
    end

    it 'defines UST_IDNR' do
      expect(Bandwidth::BusinessRegistrationTypeEnum::UST_IDNR).to eq('UST_IDNR')
    end

    it 'defines CIF' do
      expect(Bandwidth::BusinessRegistrationTypeEnum::CIF).to eq('CIF')
    end

    it 'defines NIF' do
      expect(Bandwidth::BusinessRegistrationTypeEnum::NIF).to eq('NIF')
    end

    it 'defines CNPJ' do
      expect(Bandwidth::BusinessRegistrationTypeEnum::CNPJ).to eq('CNPJ')
    end

    it 'defines UID' do
      expect(Bandwidth::BusinessRegistrationTypeEnum::UID).to eq('UID')
    end

    it 'defines OTHER' do
      expect(Bandwidth::BusinessRegistrationTypeEnum::OTHER).to eq('OTHER')
    end
  end

  describe '.all_vars' do
    it 'returns every valid enum value' do
      expect(Bandwidth::BusinessRegistrationTypeEnum.all_vars).to eq([
        'EIN',
        'CBN',
        'NEQ',
        'PROVINCIAL_NUMBER',
        'CRN',
        'VAT',
        'ACN',
        'ABN',
        'BRN',
        'SIREN',
        'SIRET',
        'NZBN',
        'UST_IDNR',
        'CIF',
        'NIF',
        'CNPJ',
        'UID',
        'OTHER'
      ])
    end
  end

  describe '.build_from_hash' do
    it 'returns the value when it matches a valid enum value' do
      expect(Bandwidth::BusinessRegistrationTypeEnum.build_from_hash('EIN')).to eq('EIN')
      expect(Bandwidth::BusinessRegistrationTypeEnum.build_from_hash('CBN')).to eq('CBN')
      expect(Bandwidth::BusinessRegistrationTypeEnum.build_from_hash('NEQ')).to eq('NEQ')
      expect(Bandwidth::BusinessRegistrationTypeEnum.build_from_hash('PROVINCIAL_NUMBER')).to eq('PROVINCIAL_NUMBER')
      expect(Bandwidth::BusinessRegistrationTypeEnum.build_from_hash('CRN')).to eq('CRN')
      expect(Bandwidth::BusinessRegistrationTypeEnum.build_from_hash('VAT')).to eq('VAT')
      expect(Bandwidth::BusinessRegistrationTypeEnum.build_from_hash('ACN')).to eq('ACN')
      expect(Bandwidth::BusinessRegistrationTypeEnum.build_from_hash('ABN')).to eq('ABN')
      expect(Bandwidth::BusinessRegistrationTypeEnum.build_from_hash('BRN')).to eq('BRN')
      expect(Bandwidth::BusinessRegistrationTypeEnum.build_from_hash('SIREN')).to eq('SIREN')
      expect(Bandwidth::BusinessRegistrationTypeEnum.build_from_hash('SIRET')).to eq('SIRET')
      expect(Bandwidth::BusinessRegistrationTypeEnum.build_from_hash('NZBN')).to eq('NZBN')
      expect(Bandwidth::BusinessRegistrationTypeEnum.build_from_hash('UST_IDNR')).to eq('UST_IDNR')
      expect(Bandwidth::BusinessRegistrationTypeEnum.build_from_hash('CIF')).to eq('CIF')
      expect(Bandwidth::BusinessRegistrationTypeEnum.build_from_hash('NIF')).to eq('NIF')
      expect(Bandwidth::BusinessRegistrationTypeEnum.build_from_hash('CNPJ')).to eq('CNPJ')
      expect(Bandwidth::BusinessRegistrationTypeEnum.build_from_hash('UID')).to eq('UID')
      expect(Bandwidth::BusinessRegistrationTypeEnum.build_from_hash('OTHER')).to eq('OTHER')
    end

    it 'raises an error for an invalid enum value' do
      expect {
        Bandwidth::BusinessRegistrationTypeEnum.build_from_hash('invalid')
      }.to raise_error(RuntimeError)
    end
  end
end
