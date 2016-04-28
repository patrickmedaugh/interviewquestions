class Test
  def solution(a)
    equilibriums = []
    a.each_with_index do |n, i|
      left_side = [a[0]]
      left_side  = a[0..i-1] unless i == 0
      puts "left side #{left_side.reduce(:+)}"
      right_side = a[i+1..-1]
      puts "right side #{right_side.reduce(:+)}"
      if left_side.reduce(:+) == right_side.reduce(:+)
        equilibriums.push(i)
      end
    end
    return equilibriums
  end
end

t = Test.new

puts t.solution([-1, 3, -4, 5, 1, -6, 2, 1])
