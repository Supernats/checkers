# -*- coding: utf-8 -*-


require_relative 'piece'

class Board

  attr_accessor :grid


  def initialize(fill_board = true)
    self.grid = Array.new(8) { Array.new(8) }
    set_pieces if fill_board
    nil
  end

  # def perform_slide(start_pos, end_pos)
  #   move_error(start_pos, end_pos)
  #   move_piece = self.grid[start_pos[0]][start_pos[1]]
  #   if move_piece.moves.include?(start_pos)
  #
  # end
  #
  # def perform_jump(start_pos, end_pos)
  #
  # end

  def perform_moves(start_pos, end_pos)
    move_error(start_pos, end_pos)
    move_piece = self.grid[start_pos[0]][start_pos[1]]
    if move_piece.moves.include?(start_pos)
    end
  end

  def to_s
    board_string = ""
    self.grid.each_index do |row|
      row_string = ""
      self.grid[row].each_index do |column|
        if self.grid[row][column].nil?
          row_string += 'X'
        else
          row_string += self.grid[row][column].to_s
        end
        row_string += ' '
      end
      board_string += "#{row_string}\n"
    end
    board_string
  end

  def set_pieces
    [:white, :red].each do |color|
      set_color(color)
    end
    nil
  end

  def set_color(color)
    setting_rows = color == :red ? (0..2).to_a : (5..7).to_a
    setting_rows.each do |row|
      (0..7).each do |column|
        if (row.even? && column.odd?) || (row.odd? && column.even?)
          piece = Piece.new([row, column], color, self)
          self.grid[row][column] = piece
        end
      end
    end
    nil
  end

  def move_error(start_pos, end_pos)
    unless !pos_available?(start_pos) && pos_available?(end_pos)
      raise "invalid move"
    end
  end

  def pos_available?(pos)
    self.grid[pos[0]][pos[1]].nil?
  end

  def pos_on_board?(pos)
    pos.none? { |dimension| dimension < 0 || dimension > 7 }
  end

  def pos_valid?(pos)
    pos_available?(pos) && pos_on_board?(pos)
  end


end