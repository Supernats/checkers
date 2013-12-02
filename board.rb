class Board

  attr_accessor :grid

  def initialize(fill_board = true)
    self.grid = Array.new(8) { Array.new(8) }
    set_pieces if fill_board
    nil
  end

end