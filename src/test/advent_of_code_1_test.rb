require_relative '../lib/advent_of_code_1.rb'
require 'minitest/autorun'

class TestDay1 < MiniTest::Unit::TestCase
	def setup
	end

	def test_total_calories_from_best_three_elves_should_return_the_best_three_sum
		first_elf = Elf.new
		first_elf.foods = [9130, 9712, 12437, 3457, 11610, 4598]
		second_elf = Elf.new
		second_elf.foods = [1000, 2000, 3000]
		third_elf = Elf.new
		third_elf.foods = [7777]
		fourth_elf = Elf.new
		fourth_elf.foods = [80001]
		fifth_elf = Elf.new
		fifth_elf.foods = [10000, 14040, 6000, 12600, 1, 2, 3, 4, 5, 200]
		
		assert_equal 173800, total_calories_from_best_three_elves([first_elf, second_elf, third_elf, fourth_elf, fifth_elf])
	end

	def test_solve_part_1_1_should_return_the_highest_calories_from_one_elf
		assert_equal 17000, solve_part_1_1(["1000", "2000", "3000", "\n", "5000", "\n", "8000", "9000", "\n", "15000", "\n"])
	end

	def test_solve_part_1_2_should_return_the_sum_of_calories_from_best_three_elves
		assert_equal 38000, solve_part_1_2(["1000", "2000", "3000", "\n", "5000", "\n", "8000", "9000", "\n", "15000", "\n"])
	end
end