require_relative 'board'

if __FILE__ == $PROGRAM_NAME

board = Board.new()
puts board
puts 0
board.perform_slide([5,0],[4,1])
puts board
puts 1
board.perform_slide([2,1],[3,2])
puts board
puts 2
board.perform_slide([5,4],[4,5])
puts board
puts 3
board.perform_slide([6,3],[5,4])
puts board
puts 4
board.perform_slide([7,2],[6,3])
puts board
puts 5
# board.perform_moves!([[[3,2],[5,0]],[[5,0],[7,2]]])
board.perform_moves([[[3,2],[5,0]],[[5,0],[7,2]]])
puts board
#
# puts board
# puts 6


end