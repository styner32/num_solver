require 'spec_helper'

describe Num do
  describe 'one line' do
    specify do
      num = Num.new([9,5,4,1,6,10], 14)
      num.calculate
      expect(num.answer).to eq([9,'+',5])
    end
  end

  describe 'two lines' do
    specify do
      num = Num.new([5,6,1,9,2,3], 138)
      num.calculate
      expect(num.answer).to eq([9, "+", 6, 15, "*", 3, 45, "+", 1, 5, "-", 2, 46, "*", 3])
    end
  end

  describe 'five lines' do
    specify do
      num = Num.new([5,10,3,1,4,4], 921)
      num.calculate
      expect(num.answer).to eq([10, "*", 4, 5, "*", 4, 20, "+", 3, 40, "*", 23, 920, "+", 1])
    end

    specify do
      num = Num.new([8, 75, 2, 75, 9, 9], 896)
      num.calculate
      expect(num.answer).to eq([9, "/", 9, 75, "-", 1, 74, "/", 2, 75, "+", 37, 112, "*", 8])
    end
  end
end