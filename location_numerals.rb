class LocationNumeralConverter
  attr_reader :sign_values
  def initialize
    @sign_values = {}
    count = 0
    ('a'..'z').to_a.each do |letter|
      @sign_values[letter] = 2**count
      count += 1
    end
  end

  def numeral_to_num(numeral)
    numerals = numeral.split('')
    sum = 0
    numerals.each do |sign_value|
      sum += @sign_values[sign_value]
    end
    sum
  end

  def num_to_numeral(num)

  end
end

lnc = LocationNumeralConverter.new
puts lnc.numeral_to_num('abc')
puts lnc.sign_values['a']
