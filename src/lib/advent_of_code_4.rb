def range_overlap?(range_1, range_2)
	# note that this does not work with "closed" range (range that exclude their end)
	(range_1.begin <= range_2.end && range_1.end >= range_2.begin)
end

def solve_part_4_1(input)
	input.each.map do |line|
		a = line.split(",").map do |v|
			splitted_sections = v.split("-")
			Integer(splitted_sections[0])..Integer(splitted_sections[1])
		end
		(a[0].cover?(a[1]) || a[1].cover?(a[0])) ? 1 : 0
	end.sum
end

def solve_part_4_2(input)
	input.each.map do |line|
		a = line.split(",").map do |v|
			splitted_sections = v.split("-")
			Integer(splitted_sections[0])..Integer(splitted_sections[1])
		end
		range_overlap?(a[0], a[1]) ? 1 : 0
	end.sum
end

if __FILE__ == $0
	puts solve_part_4_2(ARGF)
end