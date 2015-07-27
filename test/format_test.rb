require 'minitest/autorun'
require 'minitest/pride'
require './lib/format'

class FormatTest < Minitest::Test

  def test_it_exists
    assert Format
  end

  def test_it_can_convert_vertical_arrays_into_string
    example = Format.new
    assert_equal "xxx  x", example.stringify([3,1])
  end

  def test_it_can_convert_single_vertical_array_into_string
    example = Format.new
    assert_equal "xxx", example.stringify([3])
  end

  def test_it_can_convert_multiple_vertical_array_into_string
    example = Format.new
    assert_equal "xxxx xxx   x  xx", example.stringify([4,3,1,2])
  end

  def test_it_can_convert_string_into_array_with_two_columns
    example = Format.new
    assert_equal [['x', ' '], ['x', ' '], ['x', 'x']], example.transpose([3,1])
  end

  def test_it_can_convert_string_into_array_with_three_columns
    example = Format.new
    assert_equal [['x', ' ', ' '], ['x', ' ', 'x'], ['x', 'x', 'x']], example.transpose([3,1,2])
  end

  def test_it_can_convert_string_into_array_with_four_columns
    example = Format.new
    assert_equal [['x', ' ', ' ', ' '], ['x', 'x', ' ', ' '], ['x', 'x', ' ', 'x'], ['x', 'x', 'x', 'x']], example.transpose([4,3,1,2])
  end
end
