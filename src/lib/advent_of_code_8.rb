def create_tree_map_from_input(input)
	map = []
	input.each do |line|
		map << line.chars.filter { |v| v != "\n" }.map { |c| Integer(c) }
	end
	map
end

def solve_part_8_1(input)
	map = create_tree_map_from_input(input)

	res = 0
	for i in 0...(map.size) do
		line = map[i]
		for j in 0...(line.size) do
			if i == 0 || j == 0 || i == (map.size - 1) || j == (line.size - 1)
				res += 1
			else
				cell = line[j]
				biggest_in_column = map.each_with_index.filter { |v, idx| idx < i}.none? { |v, idx| v[j] >= cell } ||
								map.each_with_index.filter { |v, idx| idx > i}.none? { |v, idx| v[j] >= cell }
				biggest_in_line = line.each_with_index.filter { |l, idx| idx < j}.none? { |l, idx| l >= cell } ||
								line.each_with_index.filter { |l, idx| idx > j}.none? { |l, idx| l >= cell }

				res += 1 if biggest_in_column || biggest_in_line
			end
		end
	end
	res
end

def solve_part_8_2(input)
	map = create_tree_map_from_input(input)

	best = -1
	for i in 0...(map.size) do
		line = map[i]
		for j in 0...(line.size) do
			cell = line[j]
			number_of_tree_visible_up = 0
			number_of_tree_visible_down = 0
			number_of_tree_visible_left = 0
			number_of_tree_visible_right = 0

			if i > 0
				(i - 1).downto(0) do |u|
					number_of_tree_visible_up += 1
					break if map[u][j] >= cell
				end
			end

			(i + 1).upto(map.size - 1) do |d|
				number_of_tree_visible_down += 1
				break if map[d][j] >= cell
			end

			if j > 0
				(j - 1).downto(0) do |l|
					number_of_tree_visible_left += 1
					break if line[l] >= cell
				end
			end

			(j + 1).upto(line.size - 1) do |r|
				number_of_tree_visible_right += 1
				break if line[r] >= cell
			end

			current = number_of_tree_visible_up * number_of_tree_visible_down *
					number_of_tree_visible_right * number_of_tree_visible_left
			if current > best
				best = current
			end
		end
	end
	best
end

if __FILE__ == $0
	puts solve_part_8_2(ARGF)
end