require_relative 'board'

if __FILE__ == $PROGRAM_NAME

board = Board.new(false)
board.grid[1][6] = Piece.new([1,6], :white, board)
board.grid[1][4] = Piece.new([1,4], :white, board)
board.grid[0][5] = Piece.new([0,5], :red, board)

puts board
# p board.grid[0][5].slide_moves
# p board.grid[0][5].jump_moves
p board.grid[0][5].moves
# board.perform_slide([0,5],[1,4])
board.perform_jump([0,5],[2,7])
board.perform_slide([1,4],[0,3])
puts board



end