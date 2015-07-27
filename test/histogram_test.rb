require 'minitest/autorun'
require 'minitest/pride'
require './lib/histogram'

class HistogramTest < Minitest::Test

  def test_it_exists
    assert Histogram
  end

  def test_hash_setup
    example = Histogram.new([3,1])
    assert_equal [], example.arr[2]
  end

  def test_adjacent_one_column
    example = Histogram.new([3,1,2])
    example.rectangle_size(['x', ' ', ' '])
    assert_equal [1], example.arr[3]
  end

  def test_adjacent_two_column
    example = Histogram.new([3,3,1])
    example.rectangle_size(['x', 'x', ' '])
    assert_equal [2], example.arr[3]
  end

  def test_adjacent_three_column
    example = Histogram.new([3,3,3])
    example.rectangle_size(['x', 'x', 'x'])
    assert_equal [3], example.arr[3]
  end

  def test_adjacent_single_column
    example = Histogram.new([3,1,3])
    example.rectangle_size(['x', ' ', 'x'])
    assert_equal [1,1], example.arr[3]
  end

  def test_multiple_adjacent_single_column
    example = Histogram.new([3,3,1,3])
    example.rectangle_size(['x', 'x', ' ', 'x'])
    assert_equal [2,1], example.arr[3]
  end

  def test_multiple_adjacent_multiple_column
    example = Histogram.new([3,3,1,3,3])
    example.rectangle_size(['x', 'x', ' ', 'x', 'x'])
    assert_equal [2,2], example.arr[3]
  end

  def test_find_width_for_multiple_levels
    example = Histogram.new([2,2,1,2,2])
    example.all_widths
    assert_equal({2=>[2,2], 1=>[5]}, example.arr)
  end

  def test_find_width_for_multiple_levels2
    example = Histogram.new([3,2,1,2,3])
    example.all_widths
    assert_equal({3=> [1,1], 2=>[2,2], 1=>[5]}, example.arr)
  end

  def test_find_max_rectangle
    example = Histogram.new([3,2,1,2,3])
    assert_equal 5, example.max_retangle
  end
end
