class Histogram
  attr_reader :level, :input

  def initialize(input)
    @level = input.max
    @input = input
  end

  def stringify
    input.map do |num|
      ('x' * num).rjust(level)
    end.join
  end

  def transpose
    stringify.chars.each_slice(level).to_a.transpose
  end

  def find_width
    transpose.map do |t|
      t.count('x')
    end
  end
end
