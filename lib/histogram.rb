require_relative 'format'

class Histogram
  attr_reader :input, :level, :rectangles, :format

  def initialize(input)
    @input = input
    @level = input.max
    @rectangles = {}
    @format = Format.new

    rectangle_collection_setup
  end

  def rectangle_collection_setup
    (1..level).to_a.map do |i|
      rectangles[i] = []
    end
  end

  def single_column?(row, column)
    (row[column] == 'x' && row[column + 1] == ' ') || (row[column] == 'x' && row[column + 1].nil?)
  end

  def multiple_columns?(row, column)
    row[column] == 'x' && row[column + 1] == 'x'
  end

  def rectangle_size(row)
    col_counter = 1
    row.each_with_index do |item, column|
      if multiple_columns?(row, column)
        col_counter += 1
      elsif single_column?(row, column)
        @rectangles[level] << col_counter
      else
        col_counter = 1
      end
    end
  end

  def all_rectangles
   format.transpose(input).each do |i|
     rectangle_size(i)
     @level -= 1
   end
  end

  def max_retangle
    all_rectangles
    rectangles.map do |key, value|
      key * value.max
    end.max
  end
end
