require_relative 'board'

if __FILE__ == $PROGRAM_NAME

board = Board.new
p board.grid[0,1].class
p board.grid[0,0].class
puts
p board.grid[7,0].class

end