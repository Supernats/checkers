class InvalidMoveError < StandardError
  def message
    "invalid move"
  end
end