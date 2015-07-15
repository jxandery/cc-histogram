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
end
