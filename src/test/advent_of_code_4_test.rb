require_relative '../lib/advent_of_code_4.rb'
require 'minitest/autorun'

class TestDay4 < MiniTest::Unit::TestCase
	def setup
	end

	def test_range_overlap_should_return_true_where_only_a_few_values_are_in_common
		assert range_overlap?((2..4), (3..5))
		assert range_overlap?((2..10), (10..10))
		assert range_overlap?((2..6), (6..8))
		assert range_overlap?((2..2), (2..10))
	end

	def test_range_overlap_should_return_true_if_a_range_is_a_super_set_of_the_other
		assert range_overlap?((2..10), (3..3))
	end

	def test_range_overlap_should_return_false_if_no_overlap_occurs
		assert_equal false, range_overlap?((2..4), (8..8))
	end

	def test_solve_part_4_1
		assert_equal 25, solve_part_4_1(["14-98,14-14",
				"2-20,3-3",
				"64-67,43-63",
				"13-91,14-90",
				"65-65,47-67",
				"13-13,12-87",
				"23-26,23-27",
				"83-85,49-84",
				"11-16,10-60",
				"16-84,7-83",
				"85-85,32-85",
				"51-59,59-86",
				"18-59,19-61",
				"97-97,3-97",
				"21-21,3-22",
				"6-6,4-6",
				"23-25,24-24",
				"5-73,5-72",
				"43-44,9-44",
				"72-78,72-82",
				"40-88,40-48",
				"7-91,7-8",
				"39-52,40-97",
				"20-52,21-93",
				"11-88,44-76",
				"90-90,32-39",
				"35-86,36-36",
				"78-95,67-79",
				"11-22,12-72",
				"90-91,52-90",
				"8-83,9-83",
				"57-96,12-96",
				"34-42,23-43",
				"68-90,69-90",
				"24-92,23-74",
				"6-81,2-82",
				"1-3,4-90",
				"5-7,7-9",
				"2-8,3-7",
				"2-6,4-8"])
	end

	def test_solve_part_4_2
		assert_equal 37, solve_part_4_2(["14-98,14-14",
				"2-20,3-3",
				"64-67,43-63",
				"13-91,14-90",
				"65-65,47-67",
				"13-13,12-87",
				"23-26,23-27",
				"83-85,49-84",
				"11-16,10-60",
				"16-84,7-83",
				"85-85,32-85",
				"51-59,59-86",
				"18-59,19-61",
				"97-97,3-97",
				"21-21,3-22",
				"6-6,4-6",
				"23-25,24-24",
				"5-73,5-72",
				"43-44,9-44",
				"72-78,72-82",
				"40-88,40-48",
				"7-91,7-8",
				"39-52,40-97",
				"20-52,21-93",
				"11-88,44-76",
				"90-90,32-39",
				"35-86,36-36",
				"78-95,67-79",
				"11-22,12-72",
				"90-91,52-90",
				"8-83,9-83",
				"57-96,12-96",
				"34-42,23-43",
				"68-90,69-90",
				"24-92,23-74",
				"6-81,2-82",
				"1-3,4-90",
				"5-7,7-9",
				"2-8,3-7",
				"2-6,4-8"])
	end
end
