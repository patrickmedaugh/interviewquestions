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
    numeral_letters = []
    descending_powers_of_2 = @sign_values.values.reverse
    inverted_sign_values = @sign_values.invert
    descending_powers_of_2.each do |number|
      if number <= num
        numeral_letters.push inverted_sign_values[number]
        num -= number
      end
    end
    numeral_letters.sort.join
  end

  def simplify(numeral)
    num = numeral_to_num(numeral)
    num_to_numeral(num)
  end
end


