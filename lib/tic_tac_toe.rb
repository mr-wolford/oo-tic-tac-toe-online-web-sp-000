require 'pry'

class TicTacToe

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [6, 4, 2]
  ]

def initialize
  @board = Array.new(9, " ")
end

def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def input_to_index(user_input)
  user_input.to_i - 1
end

def move(index, token = "X")
  @board[index] = token
end

def position_taken?(index)
  @board[index] == "X" || @board[index] == "O"
end

def valid_move?(index)
  !position_taken?(index) && index.between?(0,8)
end

def turn_count
  @board.count { |i| i == "X" || i == "O" }
end

def current_player
  turn_count.even? ? "X" : "O"
end

def turn
puts "Please enter a number (1-9):"
  user_input = gets.strip
  index = input_to_index(user_input)
  if valid_move?(index)
    token = current_player
    move(index, token)
  else
    turn
  end
  display_board
end

def won?
  WIN_COMBINATIONS.detect do |combo|
  @board[combo[0]] == @board[combo[1]] &&
    @board[combo[1]] == @board[combo[2]] && position_taken?(combo[0])
  end
end

def full?
  !@board.include?(" ")
end

def draw?
  full? && !won?
end

def over?
  won? || draw?
end

def winner
  if x = won?
    @board[x.first]
  end
end

def play
  until over? || draw?
    turn
  end
  if won?
    puts "Congratulations #{winner}!"
  elsif draw?
    puts "Cat's Game!"
  end
end

end
