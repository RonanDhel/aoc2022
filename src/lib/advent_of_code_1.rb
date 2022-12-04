class Elf
	attr_accessor :foods

	def initialize
		@foods = []
	end

	def total_calories
		@foods.sum
	end
end

def total_calories_from_best_three_elves(elfs)
	elfs.map { |e| e.total_calories }.max(3).sum
end

def extract_elves(input)
	elfs = []
	curr_elf = Elf.new
	input.each do |line|
		if line == "\n"
			elfs << curr_elf
			curr_elf = Elf.new
		else
			curr_elf.foods << Integer(line)
		end
	end
	elfs
end

def solve_part_1_1(input)
	extract_elves(input).map { |e| e.total_calories }.max
end

def solve_part_1_2(input)
	total_calories_from_best_three_elves(extract_elves(input))
end

if __FILE__ == $0
	puts solve_part_1_2(ARGF)
end