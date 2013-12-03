require_relative 'board'

class Game
  attr_accessor :board, :current_player

  def initialize
    @board = Board.new
    @current_player = :red
  end

  def play
    puts "Let's play CHECKERS!!!"
    puts self.board

    until one_color_left?
      puts "Current player: #{self.current_player.to_s}"
      take_turn
      puts self.board
    end

    puts "The winner is #{winner.to_s}"
  end

  def take_turn
    begin
      move_sequence = get_move_sequence
      board.perform_moves(move_sequence)
    rescue
      puts "You can't do that!"
      retry
    end
    self.current_player = self.current_player == :red ? :white : :red
  end

  def one_color_left?
    pieces = self.board.collect_pieces
    (pieces.all? { |piece| piece.color == :red }) ||
    (pieces.all? { |piece| piece.color == :white })
  end

  def winner
    self.board.collect_pieces[0].color
  end

  def current_player_piece?(pos)
    self.board.grid[pos[0]][pos[1]].color == self.current_player
  end

  def get_move
    puts "Player, input your move in the format of y1<return>, x1<return>, " +
    "y2<return>, x2<return>"
    begin
      start_y = Integer(gets.chomp)
      start_x = Integer(gets.chomp)
      end_y = Integer(gets.chomp)
      end_x = Integer(gets.chomp)
      raise InvalidMoveError if !current_player_piece?([start_y, start_x])
    rescue
      puts "invalid move"
      retry
    end
    [[start_y, start_x],[end_y, end_x]]
  end

  def get_move_sequence
    moves = []
    more_moves = 1

    until more_moves == 0
      moves << get_move
      puts "Any more moves? 1 for yes, 0 for no"
      more_moves = Integer(gets.chomp)
    end
    moves
  end



end