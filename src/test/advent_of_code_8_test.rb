require 'minitest/autorun'
require_relative '../lib/advent_of_code_8.rb'

class TestDay8 < MiniTest::Unit::TestCase
	def setup
	end

	def test_solve_part_8_1_should_work_with_a_single_tree
		assert_equal 1, solve_part_8_1(["1"])
	end

	def test_solve_part_8_1_should_return_the_size_of_the_edge_if_edge_is_biggest
		assert_equal 16, solve_part_8_1(["99999", "95519", "90009", "94549", "99999"])
	end

	def test_solve_part_8_1_should_return_the_size_if_every_tree_is_visible
		assert_equal 25, solve_part_8_1(["30303", "25512", "65952", "34542", "30390"])
	end

	def test_solve_part_8_1_should_return_21_on_the_exemple
		assert_equal 21, solve_part_8_1(["30373", "25512", "65332", "33549", "35390"])
	end

	def test_solve_part_8_2_should_retrieve_the_best_scenic_score
		assert_equal 8, solve_part_8_2(["30373", "25512", "65332", "33549", "35390"])
	end
end