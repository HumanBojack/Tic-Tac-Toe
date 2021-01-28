class Game
	attr_accessor :board, :player1, :player2, :last_player

	def initialize
		@board = {a1: " ", a2: " ", a3: " ", b1: " ", b2: " ", b3: " ", c1: " ", c2: " ", c3: " "}
	end

	def player_creation
		puts "Entrez le pseudo du joueur 1 :"
		@player1 = Player.new(gets.chomp.capitalize, "X")
		puts "Entrez le pseudo du joueur 2 :"
		@player2 = Player.new(gets.chomp.capitalize, "O")
	end

	def play(player, position)
		loop do
			if @board[position] == " "
				@board[position] = "X".colorize(:blue) if player.color == "X"
				@board[position] = "O".colorize(:red) if player.color == "O"
				break
			else
				puts "Erreur, indiquez une autre case"
				position = gets.chomp.downcase.to_sym
			end
		end
		@last_player = player
	end

	def game_ended?
		return true if @board.values.none?(" ") || self.game_won?
	end

	def game_won?
		return true if @board[:a1] == @board[:a2] && @board[:a2] == @board[:a3] && @board[:a1] != " "
		return true if @board[:a1] == @board[:b1] && @board[:b1] == @board[:c1] && @board[:a1] != " "
		return true if @board[:a3] == @board[:b3] && @board[:b3] == @board[:c3] && @board[:a3] != " "
		return true if @board[:c1] == @board[:c2] && @board[:c2] == @board[:c3] && @board[:c1] != " "
		return true if @board[:a2] == @board[:b2] && @board[:b2] == @board[:c2] && @board[:a2] != " "
		return true if @board[:b1] == @board[:b2] && @board[:b2] == @board[:b3] && @board[:b1] != " "
		return true if @board[:c1] == @board[:b2] && @board[:b2] == @board[:a3] && @board[:c1] != " "
		return true if @board[:a1] == @board[:b2] && @board[:b2] == @board[:c3] && @board[:a1] != " "
		return false
	end

	def draw?
		return true if self.game_won? == false && @board.values.none?(" ")
		return false if self.game_won?
	end

	def win_message
		if self.draw? == true
			return "It's a draw"
		elsif self.draw? == false
			return "#{@last_player.name} won !"
		end
	end
end