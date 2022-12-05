def parse_stacks(input)
	stacks = []
	input.each_line.reverse_each do |line|
		line.chars.each_slice(4).map(&:join).each_with_index do |v, i|
			if v != "    " && v != "   \n" && v.to_i == 0 # ....yeah.... ugly as hell
				stacks[i + 1] = [] if stacks[i + 1].nil?
				stacks[i + 1] << v[1]
			end
		end
	end
	stacks
end


def solve_part_5_1(input)
	splitted_text = input.split("\n\n")
	stacks = parse_stacks(splitted_text[0])

	instructions = splitted_text[1]

	instructions.each_line do |line|
		if line.start_with? "move"
			splitted = line.split(" ")
			number = Integer(splitted[1])
			from = Integer(splitted[3])
			to = Integer(splitted[5])
			number.times do
				stacks[to] << stacks[from].pop
			end
		end
	end
	stacks.filter { |v| !v.nil? }.map { |v| v.last }.join
end

def solve_part_5_2(input)
	splitted_text = input.split("\n\n")
	stacks = parse_stacks(splitted_text[0])

	instructions = splitted_text[1]

	instructions.each_line do |line|
		if line.start_with? "move"
			splitted = line.split(" ")
			number = Integer(splitted[1])
			from = Integer(splitted[3])
			to = Integer(splitted[5])
			stacks[from].pop(number).each { |to_move| stacks[to] << to_move }
		end
	end
	stacks.filter { |v| !v.nil? }.map { |v| v.last }.join
end

if __FILE__ == $0
	p solve_part_5_2(ARGF.readlines.join)
end
