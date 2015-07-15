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
end

