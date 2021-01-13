class TicTacToe
    WIN_COMBINATIONS = [
        [0,1,2],
        [3,4,5],
        [6,7,8],
        [0,3,6],
        [1,4,7],
        [2,5,8],
        [0,4,8],
        [6,4,2],
    ]
    attr_accessor :board
    def initialize
        @board = board || Array.new(9, " ")
    end

    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-------------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-------------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end
    def input_to_index(input)
       @choice = input.to_i - 1
     end

    def move(index, token)
        @board[index] = token
    end
    
    def position_taken?(index)
        @board[index] == "X" || @board[index] == "O"
    end

    def valid_move?(position)
        !position_taken?(position) && position.between?(0,8)
    end
    def turn_count
        count = 0
        @board.each { |p| count += 1 if p == "X" || p == "O"}
        count
    end
    def current_player
        turn_count % 2 == 0?  "X" : "O"
    end
    def turn
        selection = gets.strip
        position = input_to_index(selection) 
        if valid_move?(position) 
            move(position, current_player)
            display_board
        else 
            turn
        end
    end
    def won?
        WIN_COMBINATIONS.detect do |combo|
            @board[combo[0]] == @board[combo[1]] &&
            @board[combo[1]] == @board[combo[2]] &&
            position_taken?(combo[0])
        end
    end
    def full?
        @board.all? { |token| token == "X" || token == "O" }
    end
    def draw?
        !won? && full?
    end
    def over?
        won? || draw?
    end
    def winner
        if winning_combo = won?
            @board[winning_combo.first]
        end
    end
    def play
        while !over?
            turn
        end
        if won?
            puts "Congratulations #{winner}!"
        elsif draw?
            puts "Cat's Game!"
        end
    end
end