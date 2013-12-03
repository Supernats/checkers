# -*- coding: utf-8 -*-

class Piece
  attr_accessor :pos, :color, :promoted, :board

  def initialize(pos, color, board)
    self.pos, self.color, self.board = pos, color, board
    self.promoted = false
    maybe_promote
  end

  def advance
    self.color == :white ? -1 : 1
  end

  def dup
    duped_piece = Piece.new(self.pos, self.color, self.board)
    duped_piece.color = self.color
    duped_piece
  end

  def jump_moves
    jump_moves = []
    y, x = self.pos
    slide_diffs.each do |deltas|
      dy, dx = deltas
      one_away = [y + dy, x + dx]
      if jumpable?(one_away)
        jump_pos = [one_away[0] + dy, one_away[1] + dx]
        jump_moves << jump_pos if self.board.pos_valid?(jump_pos)
      end
    end
    jump_moves
  end

  def jumpable?(pos)
    other_piece = self.board.grid[pos[0]][pos[1]]
    !self.board.pos_available?(pos) && other_piece.color != self.color
  end

  def maybe_promote
    promote_row = self.color == :white ? 0 : 7
    self.promoted = true if self.pos[0] == promote_row
  end

  def move(end_pos)
    self.pos = end_pos
  end

  def moves
    slide_moves + jump_moves
  end

  def slide_diffs
    slide_diffs = [[advance, -1],[advance, 1]]
    if self.promoted
      slide_diffs.push([-advance, -1],[-advance, 1])
    end
    slide_diffs
  end

  def slide_moves
    slide_moves = []
    y, x = self.pos
    slide_diffs.each do |deltas|
      dy, dx = deltas
      end_pos = [y + dy, x + dx]
      slide_moves << end_pos if self.board.pos_valid?(end_pos)
    end
    slide_moves
  end

  def to_s
    case self.color
    when :white
      if self.promoted
        '♔'
      else
        '○'
      end
    when :red
      if self.promoted
        '♚'
      else
        '●'
      end
    end
  end




end