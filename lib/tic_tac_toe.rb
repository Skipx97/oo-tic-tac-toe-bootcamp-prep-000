class TicTacToe

  def initialize
    @board =  board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]

  def display_board()
   puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
   puts "-----------"
   puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
   puts "-----------"
   puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end


def input_to_index(user_input)
  user_input.to_i - 1
end

def move(index, current_player = "X")
  board[index] = current_player
end

def position_taken?(location)
  @board[location] != " " && @board[location] != ""
end

def valid_move?(index)
  index.between?(0,8) && !position_taken?(index)
end

def turn()
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(index)
    move(index, current_player())
    display_board()
  else
    turn()
  end
end

def turn_count()
  count = 0
  @board.each do |str|
    if(str == "X" || str == "O")
      count += 1
    end
  end
  return count
end

def current_player
    if turn_count % 2 == 0
      "X"
    else
      "O"
    end
 end

def won?()
  WIN_COMBINATIONS.each do |win_combo|
    win_index_1 = win_combo[0]
    win_index_2 = win_combo[1]
    win_index_3 = win_combo[2]
    pos_1 = @board[win_index_1]
    pos_2 = @board[win_index_2]
    pos_3 = @board[win_index_3]
    if ((pos_1 == "X" && pos_2 == "X" && pos_3 == "X") ||   (pos_1 == "O" && pos_2 == "O" && pos_3 == "O"))
      return [win_index_1, win_index_2, win_index_3]
    else
      false
    end
  end
  false
end

def full?()
  @board.all? {|pos| pos == "X" || pos == "O"}
end

def draw?()
  if(full?() && !won?())
    true
  else
    false
  end
end

def over?()
  if(full?() || draw?() || won?())
    true
  else
    false
  end
end

def winner()
  if(won?)
    if(@board[won?()[0]] == "X")
      return "X"
    else
      return "O"
    end
  end
  else
    nil
  end
end

def current_player()
  if(turn_count() % 2 == 0)
    return "X"
  else
    return "O"
 end
end

def play()
  until over?()
turn()
  end

  if(won?())
    puts "Congratulations #{winner()}"
  elsif (draw?())
    puts "Wolf's Game"
 end
end
