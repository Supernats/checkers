class Piece
  attr_accessor :pos, :color, :promoted

  def self.move_diffs
    move_diffs = [[advance, -1],[advance, 1]]
    if self.promoted
      move_diffs.concat([advance * -1, -1],[advance * -1, 1])
    end
    move_diffs
  end

  def initialize(pos, color)
    self.pos, self.color = pos, color
    self.promoted = false
  end

  def advance
    self.color == :white ? -1 : 1
  end

  def self.maybe_promote
    promote_row = self.color == :white ? 0 : 7
    @promoted = true if self.pos[0] == promote_row
  end

  def perform_slide

  end

  def perform_jump

  end


end