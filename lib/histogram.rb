require_relative 'format'

class Histogram
  attr_reader :level, :input, :arr, :format

  def initialize(input)
    @level = input.max
    @input = input
    @arr = {}
    hash_setup
    @format = Format.new
  end

  def hash_setup
    (1..level).to_a.map do |i|
      arr[i] = []
    end
  end

  def single_column?(row, index)
    (row[index] == 'x' && row[index + 1] == ' ') || (row[index] == 'x' && row[index + 1].nil?)
  end

  def multiple_columns?(row, index)
    row[index] == 'x' && row[index + 1] == 'x'
  end

  def rectangle_size(row)
    col_counter = 1
    row.each_with_index do |item, index|
      if multiple_columns?(row, index)
        col_counter += 1
      elsif single_column?(row, index)
        @arr[level] << col_counter
      else
        col_counter = 1
      end
        index += 1
    end
  end

  def all_rectangles
   format.transpose(input).each do |i|
     rectangle_size(i)
     @level -= 1
   end
   arr
  end

  def max_retangle
    all_rectangles
    arr.map do |key, value|
      key * value.max
    end.max
  end
end
