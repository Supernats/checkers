class Board

  def initialize(fill_board = true)
    @grid = Array.new(8) { Array.new(8) }
    set_pieces if fill_board
    nil
  end

  def [](pos)
    y, x = pos
    @grid[y][x]
  end

  protected

  def []=(pos, piece)
    y, x = pos
    @grid[y][x] = piece
  end

end