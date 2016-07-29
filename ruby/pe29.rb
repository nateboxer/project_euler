class Pe
	
	def start
		puts Time.new

		@terms = Hash.new
		
		(2..100).each do |a|
			(2..100).each do |b|
				term = a ** b
				@terms[term] = true
			end
		end
	
		puts @terms.length
					
		puts Time.new
	end

	def set(x, y, c)
		c -= 1
		@grid[y][x] = c
		c
	end

end

if __FILE__ == $0
	p = Pe.new
	p.start
end
