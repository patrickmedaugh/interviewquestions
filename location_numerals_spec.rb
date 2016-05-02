require 'rspec'
require_relative 'location_numerals.rb'

RSpec.describe LocationNumeralConverter, "#numeral_to_num" do
  before(:all) do
    @lnc = LocationNumeralConverter.new
  end

  context '#numeral_to_num' do
    it 'returns the corresponding number' do
      expect(@lnc.numeral_to_num('abc')).to eq(7)
      expect(@lnc.numeral_to_num('aabc')).to eq(8)
    end
  end

  context '#num_to_numeral' do
    it 'returns the corresponding location numeral' do
      expect(@lnc.num_to_numeral(23)).to eq('abce')
      expect(@lnc.num_to_numeral(3147)).to eq('abdgkl')
    end

    it 'can accept a zero value' do
      expect(@lnc.num_to_numeral(0)).to eq('')
    end

    it 'can accept a value above 2**26' do
      expect(@lnc.numeral_to_num('zz')).to eq(67108864)
    end
  end

  context '#simplify' do
    it 'can reduce an unsimplified location numeral to a simplified location numeral' do
      expect(@lnc.simplify('abbc')).to eq('ad')
    end

    it 'can take a numeral larger than 2**26' do
      expect(@lnc.simplify('aabcdefghijklmnopqrstuvwxyz')).to eq('zz')
    end
  end
end
