require_relative '../lib/advent_of_code_2.rb'
require 'minitest/autorun'

class TestDay2 < MiniTest::Unit::TestCase
	def setup
	end

	def test_score_win_should_return_3_in_case_of_draw
		assert_equal 3, score_win(ROCK, ROCK)
		assert_equal 3, score_win(PAPER, PAPER)
		assert_equal 3, score_win(SCISSOR, SCISSOR)
	end

	def test_solve_part_2_1_should_return_the_sum_of_points
		assert_equal 14375, solve_part_2_1(File.new("input_advent_day_2.txt"))
	end

	def test_solve_part_2_2_should_return_the_sum_of_points
		assert_equal 10274, solve_part_2_2(File.new("input_advent_day_2.txt"))
	end
end