class Piece
  attr_accessor :pos, :color, :promoted, :board

  def initialize(pos, color, board)
    self.pos, self.color, self.board = pos, color, board
    self.promoted = false
  end

  def advance
    self.color == :white ? -1 : 1
  end

  def jump_moves
    jump_moves = []
  end

  def maybe_promote
    promote_row = self.color == :white ? 0 : 7
    self.promoted = true if self.pos[0] == promote_row
  end

  def move(end_pos)
    self.pos = end_pos
  end

  def slide_diffs
    slide_diffs = [[advance, -1],[advance, 1]]
    if self.promoted
      slide_diffs.concat([advance * -1, -1],[advance * -1, 1])
    end
    slide_diffs
  end

  def slide_moves
    slide_moves = []
    y, x = self.pos
    slide_diffs.each do |deltas|
      dy, dx = deltas
      end_pos = [y + dy, x + dx]
      slide_moves << end_pos if self.board.pos_available?(end_pos)
    end
    slid_moves
  end

end