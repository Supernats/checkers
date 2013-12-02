require_relative 'piece'

class Board

  attr_accessor :grid


  def initialize(fill_board = true)
    self.grid = Array.new(8) { Array.new(8) }
    set_pieces if fill_board
    nil
  end

  def perform_slide(start_pos, end_pos)
    move_error(start_pos, end_pos)
    piece = self.grid[start_pos]
    self.grid[end_pos] = piece
    self.grid[start_pos] = nil
  end

  def perform_jump(start_pos, end_pos)

  end

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
          piece = Piece.new([row, column], color, self)
          self.grid[row][column] = piece
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
    y, x = pos
    self.grid[y][x].nil?
  end

end