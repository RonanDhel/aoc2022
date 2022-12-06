def solve_part_6_1(input)
	size = 4
	input.chars.each_cons(size).find_index { |v| v.uniq.length == v.length } + size
end

def solve_part_6_2(input)
	size = 14
	input.chars.each_cons(size).find_index { |v| v.uniq.length == v.length } + size
end

if __FILE__ == $0
	p solve_part_6_2(ARGF.readlines.join)
end