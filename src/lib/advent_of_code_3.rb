GROUP_SIZE = 3

def item_to_priority(item)
	case item
	when 'a'..'z'
		item.bytes[0] - 97 + 1 # 97 is the ascii byte value of 'a'
	when 'A'..'Z'
		item.bytes[0] - 65 + 1 + 26 # 65 is the ascii byte value of 'A'
	else
		raise
	end
end

def solve_part_3_1(input)
	input.each.map do |line|
		first_compartment = line[0...(line.length / 2)].chars
		second_compartment = line[(line.length / 2)..-1].chars
		duplicate_items = first_compartment.intersection(second_compartment)
		raise if duplicate_items.length != 1
		item_to_priority(duplicate_items[0])
	end.sum
end

def solve_part_3_2(input)
	input.each.each_slice(GROUP_SIZE).map do |group|
		badge = (group[0].chars.intersection(group[1].chars, group[2].chars))[0]
		raise if badge.nil?
		item_to_priority(badge)
	end.sum
end

if __FILE__ == $0
	puts solve_part_3_2(ARGF)
end