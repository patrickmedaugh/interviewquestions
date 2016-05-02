class LocationNumeralConverter
  attr_reader :sign_values, :descending_powers_of_2, :sign_letters

  def initialize
    @sign_values = {}
    count = 0
    ('a'..'z').to_a.each do |letter|
      @sign_values[letter] = 2**count
      count += 1
    end
    @descending_powers_of_2 = @sign_values.values.reverse
    @sign_letters = @sign_values.invert
  end

  def numeral_to_num(numeral)
    numerals = numeral.split('')
    numerals.reduce(0) do |sum, sign_value|
      sum += @sign_values[sign_value]
    end
  end

  def num_to_numeral(num, numeral_letters=[])
    @descending_powers_of_2.each do |number|
      if number <= num
        numeral_letters.push sign_letters[number]
        num -= number
        break if num >= sign_values['z']
      end
    end
    num_to_numeral(num, numeral_letters) if num >= sign_values['z']
    numeral_letters.sort.join
  end

  def simplify(numeral)
    num = numeral_to_num(numeral)
    num_to_numeral(num)
  end
end


