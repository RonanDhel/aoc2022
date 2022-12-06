 require_relative '../lib/advent_of_code_6.rb'
require 'minitest/autorun'

class TestDay6 < MiniTest::Unit::TestCase
	def setup
	end

	def test_solve_part_6_1_should_find_the_index_of_4_unique_consecutive_chars
		assert_equal 6, solve_part_6_1("abbacdjghm")
	end

	def test_solve_part_6_2_should_find_the_index_of_14_unique_consecutive_chars
		assert_equal 19, solve_part_6_2("mjqjpqmgbljsphdztnvjfqwrcgsmlb")
	end
end