RockPaperScissorType = Struct.new(:win_against, :points)

ROCK = RockPaperScissorType.new
PAPER = RockPaperScissorType.new
SCISSOR = RockPaperScissorType.new

ROCK.win_against = SCISSOR
ROCK.points = 1

PAPER.win_against = ROCK
PAPER.points = 2

SCISSOR.win_against = PAPER
SCISSOR.points = 3

def score_win(type_player, type_opposing_player)
	if type_player == type_opposing_player # draw
		3
	elsif type_player.win_against == type_opposing_player
		6
	else
		0
	end
end

def solve_part_2_1(input)
	input.each.map do |line|
		op_choice = case line[0]
		when 'A'
			ROCK
		when 'B'
			PAPER
		when 'C'
			SCISSOR
		end

		own_choice = case line[2]
		when 'X'
			ROCK
		when 'Y'
			PAPER
		when 'Z'
			SCISSOR
		end

		own_choice.points + score_win(own_choice, op_choice)
	end.sum
end

def solve_part_2_2(input)
	input.each.map do |line|
		op_choice = case line[0]
		when 'A'
			ROCK
		when 'B'
			PAPER
		when 'C'
			SCISSOR
		end

		own_choice = case line[2]
		when 'X' # defeat
			op_choice.win_against
		when 'Y' # draw
			op_choice
		when 'Z' # win
			# well, imo, that's a bit of a hack, and not really scalable
			# for example, a variations with more tools (Spock and Lizard) would make this fail miserably
			op_choice.win_against.win_against
		end

		own_choice.points + score_win(own_choice, op_choice)
	end.sum
end

if __FILE__ == $0
	puts solve_part_2_2(ARGF)
end