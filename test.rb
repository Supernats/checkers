require_relative 'board'

if __FILE__ == $PROGRAM_NAME

board = Board.new
p board.grid[2][1].pos
p board.grid[2][1].color
p board.grid[2][1].slide_diffs
p board.grid[2][1].slide_moves

puts
p board.grid[5][2].pos
p board.grid[5][2].color
p board.grid[5][2].slide_diffs
p board.grid[5][2].slide_moves


end