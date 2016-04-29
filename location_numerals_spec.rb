require 'rspec'
require_relative 'location_numerals.rb'

RSpec.describe LocationNumeralConverter, "#numeral_to_num" do
  context 'given a location numeral' do
    it 'returns the corresponding number' do
      lnc = LocationNumeralConverter.new
      expect(lnc.numeral_to_num('abc')).to eq(7)
      expect(lnc.numeral_to_num('aabc')).to eq(8)
    end
  end

  context 'given a number' do
    it 'returns the corresponding location numeral' do
      lnc = LocationNumeralConverter.new
      expect(lnc.num_to_numeral(23)).to eq('abce')
      expect(lnc.num_to_numeral(3147)).to eq('abdgkl')
    end
  end

  context 'given a location numeral' do
    it 'can reduce it to a simplified location numeral' do
      lnc = LocationNumeralConverter.new
      expect(lnc.simplify('abbc')).to eq('ad')
    end
  end
end
