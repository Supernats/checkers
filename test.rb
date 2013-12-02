require_relative 'board'

if __FILE__ == $PROGRAM_NAME

board = Board.new
p board.grid[0][1].pos
p board.grid[0][1].color
end