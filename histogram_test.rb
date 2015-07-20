require 'minitest/autorun'
require 'minitest/pride'
require './histogram'

class HistogramTest < Minitest::Test

  def test_it_exists
    assert Histogram
  end

  def test_hash_setup
    example = Histogram.new([3,1])
    assert_equal [], example.arr[2]
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

  def test_it_can_convert_string_into_array_with_two_columns
    example = Histogram.new([3,1])
    assert_equal [['x', ' '], ['x', ' '], ['x', 'x']], example.transpose
  end

  def test_it_can_convert_string_into_array_with_three_columns
    example = Histogram.new([3,1,2])
    assert_equal [['x', ' ', ' '], ['x', ' ', 'x'], ['x', 'x', 'x']], example.transpose
  end

  def test_it_can_convert_string_into_array_with_four_columns
    example = Histogram.new([4,3,1,2])
    assert_equal [['x', ' ', ' ', ' '], ['x', 'x', ' ', ' '], ['x', 'x', ' ', 'x'], ['x', 'x', 'x', 'x']], example.transpose
  end

  def test_adjacent_one_column
    example = Histogram.new([3,1,2])
    example.widths(['x', ' ', ' '])
    assert_equal [1], example.arr[3]
  end

  def test_adjacent_two_column
    example = Histogram.new([3,3,1])
    example.widths(['x', 'x', ' '])
    assert_equal [2], example.arr[3]
  end

  def test_adjacent_three_column
    example = Histogram.new([3,3,3])
    example.widths(['x', 'x', 'x'])
    assert_equal [3], example.arr[3]
  end

  def test_adjacent_single_column
    example = Histogram.new([3,1,3])
    example.widths(['x', ' ', 'x'])
    assert_equal [1,1], example.arr[3]
  end

  def test_multiple_adjacent_single_column
    example = Histogram.new([3,3,1,3])
    example.widths(['x', 'x', ' ', 'x'])
    assert_equal [2,1], example.arr[3]
  end

  def test_multiple_adjacent_multiple_column
    example = Histogram.new([3,3,1,3,3])
    example.widths(['x', 'x', ' ', 'x', 'x'])
    assert_equal [2,2], example.arr[3]
  end

  def test_find_width_for_multiple_levels
    example = Histogram.new([2,2,1,2,2])
    input = [['x', 'x', ' ', 'x', 'x'], ['x', 'x', 'x', 'x', 'x']]
    example.all_widths
    assert_equal({2=>[2,2], 1=>[5]}, example.arr)
  end

  def test_find_width_for_multiple_levels2
    example = Histogram.new([3,2,1,2,3])
    input = [['x', ' ', ' ', ' ', 'x'],['x', 'x', ' ', 'x', 'x'], ['x', 'x', 'x', 'x', 'x']]
    example.all_widths
    assert_equal({3=> [1,1], 2=>[2,2], 1=>[5]}, example.arr)
  end

  def test_find_max_rectangle
    example = Histogram.new([3,2,1,2,3])
    assert_equal 5, example.max_retangle
  end
end
