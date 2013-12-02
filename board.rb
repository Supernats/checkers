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

  def perform_slide(start_pos, end_pos)
    move_error(start_pos, end_pos)
    piece = @grid[start_pos]
    @grid[end_pos] = piece
    @grid[start_pos] = nil
  end

  def perform_jump(start_pos, end_pos)

  end


  protected

  def move_error(start_pos, end_pos)
    raise "invalid move" unless valid_start?(start_pos) && valid_end?(end_pos)
  end

  def valid_start?(pos)
    !@grid[y, x].nil?
  end

  def valid_end?(pos)
    @grid[y, x].nil?
  end

  def []=(pos, piece)
    y, x = pos
    @grid[y][x] = piece
  end

end