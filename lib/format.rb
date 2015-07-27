class Format

  def stringify(input)
    input.map do |num|
      ('x' * num).rjust(input.max)
    end.join
  end

  def transpose(input)
    stringify(input).chars.each_slice(input.max).to_a.transpose
  end
end
