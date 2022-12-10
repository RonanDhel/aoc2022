require 'set'

def input_to_instructions(input)
	input.each.map do |line|
		cmd, times = line.split(" ")
		[cmd, Integer(times)]
	end
end

def too_far_away?(first_position, second_position)
	if (-1..1).include? first_position[0] - second_position[0]
		if (-1..1).include? first_position[1] - second_position[1]
			return false
		end
	end
	true
end

def update_tail(head_position, tail_position, tail_previous_positions_set)
	tail_position.each_with_index do |curr_knot, idx|
		# if we are the first knot, then we follow the head, otherwise we follow the previous knot (knot whose index is the current - 1)
		prev_knot = idx == 0 ? head_position : tail_position[idx - 1]

		if too_far_away? prev_knot, curr_knot
			if prev_knot[0] == curr_knot[0]
				# we are in the same column
				move_y = prev_knot[1] > curr_knot[1] ? 1 : -1
				curr_knot[1] += move_y
			elsif prev_knot[1] == curr_knot[1]
				# we are in the same row
				move_x = prev_knot[0] > curr_knot[0] ? 1 : -1
				curr_knot[0] += move_x
			else
				# we are not in the same row nor the same column
				move_x = prev_knot[0] > curr_knot[0] ? 1 : -1
				move_y = prev_knot[1] > curr_knot[1] ? 1 : -1
				curr_knot[0] += move_x
				curr_knot[1] += move_y
			end
		end
	end
	tail_previous_positions_set << tail_position[-1].dup
	# if we don't dup it, we get owned by the fact that the object is shared and mutable
end

def move_head_up(head_position, tail_position, tail_previous_positions_set)
	head_position[1] += 1
	update_tail(head_position, tail_position, tail_previous_positions_set)
end

def move_head_down(head_position, tail_position, tail_previous_positions_set)
	head_position[1] -= 1
	update_tail(head_position, tail_position, tail_previous_positions_set)
end

def move_head_right(head_position, tail_position, tail_previous_positions_set)
	head_position[0] += 1
	update_tail(head_position, tail_position, tail_previous_positions_set)
end

def move_head_left(head_position, tail_position, tail_previous_positions_set)
	head_position[0] -= 1
	update_tail(head_position, tail_position, tail_previous_positions_set)
end

def solve_moving_rope_of_length(instructions, rope_length)
	head_position = [0, 0]
	tail_position = Array.new(rope_length) { [0, 0] }
	tail_previous_positions_set = []

	instructions.each do |instruct|
		case instruct[0]
		when 'U'
			instruct[1].times { move_head_up head_position, tail_position, tail_previous_positions_set }
		when 'D'
			instruct[1].times { move_head_down head_position, tail_position, tail_previous_positions_set }
		when 'R'
			instruct[1].times { move_head_right head_position, tail_position, tail_previous_positions_set }
		when 'L'
			instruct[1].times { move_head_left head_position, tail_position, tail_previous_positions_set }
		end
	end
	tail_previous_positions_set.to_set.size
end

def solve_part_9_1(input)
	solve_moving_rope_of_length(input_to_instructions(input), 1)
end

def solve_part_9_2(input)
	solve_moving_rope_of_length(input_to_instructions(input), 9)
end

if __FILE__ == $0
	puts solve_part_9_2(ARGF)
end