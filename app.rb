require 'bundler'
Bundler.require
require_relative 'lib/player'
require_relative 'lib/game'
require_relative 'lib/visual'
require_relative 'lib/leaderboard'

leaderboard = LeaderBoard.new
loop do
new_game = Game.new
new_visual = Visual.new

new_visual.game_menu(leaderboard)
new_game.player_creation

system "clear"
new_visual.board(new_game.board)
until new_game.game_ended?
	print "Entrez une position (#{new_game.player1.color}) >> "
	new_game.play(new_game.player1, gets.chomp.downcase.to_sym)
	new_visual.board(new_game.board)
	break if new_game.game_ended?
	print "Entrez une position (#{new_game.player2.color}) >> "
	new_game.play(new_game.player2, gets.chomp.downcase.to_sym)
	new_visual.board(new_game.board)
end
puts new_game.win_message
gets

leaderboard.add(new_game.last_player.name) if new_game.draw? == false
leaderboard.save

new_game = 0
end
