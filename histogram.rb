class Histogram
  attr_reader :level, :input, :arr

  def initialize(input)
    @level = input.max
    @input = input
    @arr = {}
    hash_setup
  end

  def hash_setup
    (1..level).to_a.map do |i|
      arr[i] = []
    end
  end

  def stringify
    input.map do |num|
      ('x' * num).rjust(level)
    end.join
  end

  def transpose
    stringify.chars.each_slice(level).to_a.transpose
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
   transpose.each do |input|
     widths(input)
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

  def find_all_width
    transpose.map do |items|
      width_counter = 0
      items.map.each_with_index do |item, index|
        widths(item, index)
        width_counter += 1
        arr
      end
    end
  end
end
