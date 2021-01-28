class Visual

	def game_menu(leaderboard)
		system "clear"
		puts "			Bienvenue dans:"
		puts  "                                            ▄▄                      
▀████▄     ▄███▀                            ██                      
  ████    ████                                                      
  █ ██   ▄█ ██   ▄██▀██▄▀███▄███▀████████▄▀███   ▄██▀██▄▀████████▄  
  █  ██  █▀ ██  ██▀   ▀██ ██▀ ▀▀  ██   ▀██  ██  ██▀   ▀██ ██    ██  
  █  ██▄█▀  ██  ██     ██ ██      ██    ██  ██  ██     ██ ██    ██  
  █  ▀██▀   ██  ██▄   ▄██ ██      ██   ▄██  ██  ██▄   ▄██ ██    ██  
▄███▄ ▀▀  ▄████▄ ▀█████▀▄████▄    ██████▀ ▄████▄ ▀█████▀▄████  ████▄
                                  ██                                
                                ▄████▄                              
"
		test = HighLine.new
		loop do
		test.choose do |menu|
			menu.choice("Lancer une nouvelle partie") {raise StopIteration}
			menu.choice("Voir le tableau des scores") {leaderboard.show}
			menu.choice("Quitter") {exit}
		end
	end
	end

	def board(board)
	system "clear"
	puts "   [1] [2] [3]"
	puts "[a] #{board[:a1]} | #{board[:a2]} | #{board[:a3]} "
	puts "   ---|---|---"
	puts "[b] #{board[:b1]} | #{board[:b2]} | #{board[:b3]} "
	puts "   ---|---|---"
	puts "[c] #{board[:c1]} | #{board[:c2]} | #{board[:c3]} "
	end
end

