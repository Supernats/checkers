class Piece
  attr_accessor :pos, :color, :promoted, :board

  def initialize(pos, color)
    self.pos, self.color = pos, color
    self.promoted = false
  end

  def advance
    self.color == :white ? -1 : 1
  end

  def maybe_promote
    promote_row = self.color == :white ? 0 : 7
    @promoted = true if self.pos[0] == promote_row
  end

  def move_diffs
    slide_diffs = [[advance, -1],[advance, 1]]
    if self.promoted
      slide_diffs.concat([advance * -1, -1],[advance * -1, 1])
    end
    slide_diffs
  end

  def move(end_pos)
    self.pos = end_pos
  end

end