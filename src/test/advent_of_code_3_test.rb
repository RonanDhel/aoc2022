require_relative '../lib/advent_of_code_3.rb'
require 'minitest/autorun'

class TestDay3 < MiniTest::Unit::TestCase
	def setup
	end

	def test_item_to_priority_should_return_correct_values_for_lowercase
		('a'..'z').each_with_index do |v, i|
			assert_equal i + 1, item_to_priority(v)
		end
	end

	def test_solve_part_3_1
		assert_equal 157, solve_part_3_1(["vJrwpWtwJgWrhcsFMMfFFhFp",
					"jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL",
					"PmmdzqPrVvPwwTWBwg",
					"wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn",
					"ttgJtRGJQctTZtZT",
					"CrZsJsPPZsGzwwsLwLmpwMDw"])
	end

	def test_solve_part_3_2_should_return_the_sum_of_points
		assert_equal 52, solve_part_3_2(["Zbeaear", "AZERTY", "CrZsJsPPZ"])
	end
end