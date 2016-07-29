class Pe
	
	def start
		puts Time.new

		file = File.new("words.txt", "r")
		line = file.gets
		words = line.split(",")
		words.map! { |word| word = word[1, word.length - 2] }
		
			
		puts Time.new
	end

end

if __FILE__ == $0
	p = Pe.new
	p.start
end
