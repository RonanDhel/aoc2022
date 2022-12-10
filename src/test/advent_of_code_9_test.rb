require 'minitest/autorun'
require_relative '../lib/advent_of_code_9.rb'

class TestDay8 < MiniTest::Unit::TestCase
	def setup
	end

	def test_solve_part_9_1_should_return_the_number_of_node_encountered
		assert_equal 13, solve_part_9_1(["R 4", "U 4", "L 3", "D 1", "R 4", "D 1", "L 5", "R 2"])
	end

	def test_solve_part_9_2_should_return_the_number_of_node_encountered
		assert_equal 36, solve_part_9_2(["R 5", "U 8", "L 8", "D 3", "R 17", "D 10", "L 25", "U 20"])
	end

end
