#!/usr/bin/env ruby
@initital_board = [
  ["_","_","_","_","_","_","_","_","_","_"],
  ["_","_","_","_","_","_","_","_","_","_"],
  ["_","_","_","_","_","_","_","_","_","_"],
  ["_","_","_","_","_","_","_","_","_","_"],
  ["_","_","_","_","_","_","_","_","_","_"],
  ["_","_","_","_","_","_","_","_","_","_"],
  ["_","_","_","_","_","_","_","_","_","_"],
  ["_","_","_","_","_","_","_","_","_","_"],
  ["_","_","_","_","_","_","_","_","_","_"],
  ["_","_","_","_","_","_","_","_","_","_"]
]
@board = @initital_board
@player_position = [0,0]
move = ""

def read_char
  input = STDIN.getc.chr
  if input == "\e" then
    input << STDIN.read_nonblock(3) rescue nil
    input << STDIN.read_nonblock(2) rescue nil
  end
  return input
end

def drawBoard
  @board[@player_position[1]][@player_position[0]] = "8"
  @board.each do |row|
     row.each do |column|
       print "#{column} "
     end
     puts ""
  end
end

while move != "x"
  drawBoard
  puts "?"
  move = read_char
  case move
  when "w", "\e[A"
    @board[@player_position[1]][@player_position[0]] = "_"
    if @player_position[1] - 1 >= 0
      @player_position[1] -= 1
    else
      system('say "beep"')
      puts "Bump"
    end
  when "a", "\e[D"
    @board[@player_position[1]][@player_position[0]] = "_"
    if @player_position[0] - 1 >= 0
      @player_position[0] -= 1
    else
      system('say "beep"')
      puts "Bump"
    end
  when "s", "\e[B"
    @board[@player_position[1]][@player_position[0]] = "_"
    if @player_position[1] + 1 < @initital_board.length
      @player_position[1] += 1
    else
      system('say "beep"')
      puts "Bump"
    end
  when "d", "\e[C"
    @board[@player_position[1]][@player_position[0]] = "_"
    if @player_position[0] + 1 < @initital_board[0].length
      @player_position[0] += 1
    else
      system('say "beep"')
      puts "Bump"
    end
  else
    "Didn't quite catch that. Use 'wasd' to move around"
  end
end
