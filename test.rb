require_relative 'board'

if __FILE__ == $PROGRAM_NAME

board = Board.new
p board.grid[0][1].pos
p board.grid[0][1].color
p board.pos_available?([0,1])
p board.pos_available?([0,2])

puts
p board.grid[7][0].pos
p board.grid[7][0].color
p board.pos_available?([7,0])
p board.pos_available?([7,1])



end