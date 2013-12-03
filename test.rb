require_relative 'board'

if __FILE__ == $PROGRAM_NAME

board = Board.new(false)
board.grid[1][6] = Piece.new([1,6], :white, board)
board.grid[0][3] = Piece.new([0,3], :white, board)
board.grid[0][5] = Piece.new([0,5], :red, board)

puts board
# p board.grid[0][5].slide_moves
# p board.grid[0][5].jump_moves
p board.grid[0][5].moves
# p board.grid[0][3].moves



end