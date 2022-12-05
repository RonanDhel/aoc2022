require_relative '../lib/advent_of_code_5.rb'
require 'minitest/autorun'

class TestDay5 < MiniTest::Unit::TestCase
	def setup
	end

	def test_parse_stacks
		assert_equal [nil, ["Z", "N"], ["M", "C", "D"], ["P"]], parse_stacks("    [D]    \n[N] [C]    \n[Z] [M] [P]\n 1   2   3 ")
	end

	def test_solve_part_5_1
		assert_equal "MZ", solve_part_5_1("    [D]    \n[N] [C]    \n[Z] [M] [P]\n 1   2   3 \n\nmove 1 from 2 to 1\nmove 1 from 2 to 3\nmove 3 from 1 to 3")
	end

	def test_solve_part_5_2
		assert_equal "ZCD", solve_part_5_2("    [D]    \n[N] [C]    \n[Z] [M] [P]\n 1   2   3 \n\nmove 1 from 2 to 1\nmove 2 from 1 to 3")
	end
end