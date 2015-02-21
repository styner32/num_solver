class Num
  attr_reader :answer

  def initialize(numbers, result, processed = [])
    @numbers = numbers.sort_by { |number| number }.reverse
    @count = numbers.count
    @result = result
    @processed = processed
  end

  def calculate
    (0...@count-1).each do |i|
      (i+1...@count).each do |j|
        operate(i, j, '+')
        operate(i, j, '-')
        operate(i, j, '*')
        operate(i, j, '/')
      end
    end
  end

  def operate(index1, index2, operator)
    result = case operator
    when '+'
      @numbers[index1] + @numbers[index2]
    when '-'
      @numbers[index1] - @numbers[index2]
    when '*'
      @numbers[index1] * @numbers[index2]
    when '/'
      return if @numbers[index2] <= 1
      return unless @numbers[index1] % @numbers[index2] == 0
      @numbers[index1] / @numbers[index2]
    end

    step = [@numbers[index1], operator, @numbers[index2]]
    if result == @result
      @answer = @processed + step
    else
      if @count == 2
#        puts "DEAD END: #{(@processed + step).inspect} - #{@numbers}"
        return
      end
      start_with(index1, index2, step, result) if @answer.nil?
    end
  end

  def start_with(index1, index2, step, result)
    numbers = []
    @numbers.each_with_index do |number, index|
      if index != index1 && index != index2
        if result > number
          numbers << result
          result = -1
        end
        numbers << number
      end
    end
    numbers << result if result != -1

    num = Num.new(numbers, @result, @processed + step)
    num.calculate
    @answer = num.answer if num.answer
  end
end