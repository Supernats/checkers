require_relative 'piece'

class Board

  attr_accessor :grid

  $pieces = 0

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

  def set_pieces
    [:white, :red].each do |color|
      set_color(color)
    end
  end

  def set_color(color)
    setting_rows = color == :white ? (0..2).to_a : (5..7).to_a
    setting_rows.each do |row|
      (0..7).each do |column|
        if (row.even? && column.odd?) || (row.odd? && column.even?)
          @grid[row, column] = Piece.new([row, column], color, self)
          $pieces += 1
        end
      end
    end

  end


  def move_error(start_pos, end_pos)
    unless !pos_available?(start_pos) && pos_available?(end_pos)
      raise "invalid move"
    end
  end

  def pos_available?(pos)
    @grid[y, x].nil?
  end

  def []=(pos, piece)
    y, x = pos
    @grid[y][x] = piece
  end

end