class Piece
  attr_accessor :pos, :color, :promoted

  def self.move_diffs

  end

  def self.maybe_promote

  end

  def initialize(pos, color)
    self.pos, self.color = pos, color
    self.promoted = false
  end

  def perform_slide

  end

  def perform_jump

  end


end