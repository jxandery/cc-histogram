require './format'

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

  def single_column?(items, index)
    (items[index] == 'x' && items[index + 1] == ' ') || (items[index] == 'x' && items[index + 1].nil?)
  end

  def multiple_columns?(items, index)
    items[index] == 'x' && items[index + 1] == 'x'
  end

  def widths(items)
    col_counter = 1
    items.each_with_index do |item, index|
      if multiple_columns?(items, index)
        col_counter += 1
      elsif single_column?(items, index)
        @arr[level] << col_counter
      else
        col_counter = 1
      end
        index += 1
    end
  end

  def all_widths
   format.transpose(input).each do |i|
     widths(i)
     @level -= 1
   end
   arr
  end

  def max_retangle
    all_widths
    arr.map do |key, value|
      key * value.max
    end.max
  end
end
