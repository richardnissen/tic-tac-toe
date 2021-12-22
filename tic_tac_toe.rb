# frozen_string_literal: true

class Board
  def initialize
    @board = [%w[1 2 3], %w[4 5 6], %w[7 8 9]]
  end

  def add_brick(place, symbol)
    @board[(place - 1) / 3][(place - 1) % 3] = symbol
  end

  def to_s
    "#{@board[0]}\n#{@board[1]}\n#{@board[2]}\n"
  end

  def win_condition
    if @board[0][0] == @board[0][1] && @board[0][1] == @board[0][2]
      @board[0][0]
    elsif @board[1][0] == @board[1][1] && @board[1][1] == @board[1][2]
      @board[1][0]
    elsif @board[2][0] == @board[2][1] && @board[2][1] == @board[2][2]
      @board[2][0]
    elsif @board[0][0] == @board[1][0] && @board[1][0] == @board[2][0]
      @board[0][0]
    elsif @board[0][1] == @board[1][1] && @board[1][1] == @board[2][1]
      @board[0][1]
    elsif @board[0][2] == @board[1][2] && @board[1][2] == @board[2][2]
      @board[0][2]
    elsif @board[0][0] == @board[1][1] && @board[1][1] == @board[2][2]
      @board[0][0]
    elsif @board[0][2] == @board[1][1] && @board[1][1] == @board[2][0]
      @board[0][2]
    else
      false
    end
  end
end

class Player
  attr_accessor :name, :symbol

  def initialize(name, symbol)
    @name = name
    @symbol = symbol
  end
end

def prompt(text)
  puts text
  gets.chomp
end

board = Board.new
turn = 0
players = []

puts "Welcome to Tic Tac Toe!\n"

players.push(Player.new(prompt('Please enter the name of Player 1:'),
                        prompt('Please enter the symbol you would like to use (X, O, etc)')))
players.push(Player.new(prompt('Please enter the name of Player 2:'),
                        prompt('Please enter the symbol you would like to use (X, O, etc)')))

until board.win_condition || turn == 9
  puts board
  puts "#{players[turn % 2].name} please select the number on which you would like to place your marker"
  board.add_brick(gets.chomp.to_i, players[turn % 2].symbol)
  turn += 1
end

puts board
case board.win_condition
when players[0].symbol
  puts "#{players[0].name} Won!"
when players[1].symbol
  puts "#{players[1].name} Won!"
else
  puts 'Draw'
end
