require './num'

numbers = ARGV[0..5].map(&:to_i)
result = ARGV[6].to_i

num = Num.new(numbers, result)
num.calculate
p num.answer