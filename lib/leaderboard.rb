class LeaderBoard
	attr_accessor :scores

	def initialize
		@scores = File.read("leaderboard.json")
		@scores = eval(@scores)
	end

	def add(player_name)
		@scores[player_name.to_sym] = 0 if @scores[player_name.to_sym].nil?
		@scores[player_name.to_sym] += 1
	end

	def show
		system "clear"
		puts "-" * 50
		@scores = @scores.sort_by(&:last).reverse
		@scores.each do |i|
			puts "#{i[0]} possède #{i[1]} victoires."
		end
		puts "-" * 50
	end

	def save
		File.write("leaderboard.json", JSON.pretty_generate(@scores))
	end
end