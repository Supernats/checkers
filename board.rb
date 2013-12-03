# -*- coding: utf-8 -*-

require_relative 'piece'
require_relative 'errors'

class Board

  attr_accessor :grid


  def initialize(fill_board = true)
    @grid = Array.new(8) { Array.new(8) }
    set_pieces if fill_board
  end

  def dup
    duped_board = Board.new(false)
    (0..7).each do |row|
      (0..7).each do |column|
        if !self.grid[row][column].nil?
          duped_piece = self.grid[row][column].dup
          duped_board.grid[row][column] = duped_piece
        end
      end
    end
    duped_board
  end

  def get_jumped_pos(start_pos, end_pos)
    dy = (end_pos[0] - start_pos[0])/2
    dx = (end_pos[1] - start_pos[1])/2
    [start_pos[0] + dy, start_pos[1] + dx]
  end

  def perform_move(start_pos, end_pos)
    move_piece = self.grid[start_pos[0]][start_pos[1]]
    if valid_move?(start_pos, end_pos)
      move_piece.pos = end_pos
      move_piece.maybe_promote
      self.grid[end_pos[0]][end_pos[1]] = move_piece
      self.grid[start_pos[0]][start_pos[1]] = nil
      return true
    end
    false
  end

  def perform_moves(move_sequence)
    if valid_move_seq?(move_sequence)
      perform_moves!(move_sequence)
      true
    else
      raise InvalidMoveError
    end

  end

  def perform_moves!(move_sequence)
    if move_sequence.count == 1
      start_pos, end_pos = move_sequence
      perform_jump(start_pos, end_pos) if !perform_slide(start_pos, end_pos)
    else
      move_sequence.each do |move|
        start_pos, end_pos = move
        perform_jump(start_pos, end_pos)
      end
    end
  end

  def perform_slide(start_pos, end_pos)
    perform_move(start_pos, end_pos)
  end

  def perform_jump(start_pos, end_pos)
    move_performed = perform_move(start_pos, end_pos)
    if move_performed
      jumped_pos = get_jumped_pos(start_pos, end_pos)
      self.grid[jumped_pos[0]][jumped_pos[1]] = nil
    end
    move_performed
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

  def valid_move_seq?(move_sequence)
    duped_board = self.dup
    begin
      duped_board.perform_moves!(move_sequence)
    rescue
      return false
    else
      return true
    end
  end

  def valid_move?(start_pos, end_pos)
    move_piece = self.grid[start_pos[0]][start_pos[1]]
    if !move_piece.moves.include?(end_pos) ||
        self.grid[start_pos[0]][start_pos[1]].nil?
        raise InvalidMoveError, "invalid move"
    else
      true
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