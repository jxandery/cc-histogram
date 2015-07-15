require 'minitest/autorun'
require 'minitest/pride'
require './histogram'

class HistogramTest < Minitest::Test

  def test_it_exists
    assert Histogram
  end

  def test_it_can_convert_vertical_arrays_into_string
    example = Histogram.new([3,1])
    assert_equal "xxx  x", example.stringify
  end

  def test_it_can_convert_single_vertical_array_into_string
    example = Histogram.new([3])
    assert_equal "xxx", example.stringify
  end

  def test_it_can_convert_multiple_vertical_array_into_string
    example = Histogram.new([4,3,1,2])
    assert_equal "xxxx xxx   x  xx", example.stringify
  end

  def test_it_can_convert_string_into_array
    example = Histogram.new([3,1])
    assert_equal [['x', ' '], ['x', ' '], ['x', 'x']], example.transpose
  end
end
