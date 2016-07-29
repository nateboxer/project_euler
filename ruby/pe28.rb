class Pe
	
	def start
		puts Time.new

		@size = 1001 
		@grid = Array.new(@size) {Array.new(@size) {|i| 0}}

		x = @size - 1
		y = 0 
		c = @size * @size 
		@grid[y][x] = c
		mode = :left
		while has_exits(x, y) 

			if check(x, y, -1, 0) && mode == :left
				x -= 1
				c = set(x, y, c)
			else
				mode = :down
			end

			if check(x, y, 0, 1) && mode == :down
				y += 1
				c = set(x, y, c)
			else
				mode = :right
			end

			if check(x, y, 1, 0) && mode == :right
				x += 1
				c = set(x, y, c)
			else
				mode = :up
			end

			if check(x, y, 0, -1) && mode == :up
				y -= 1
				c = set(x, y, c)
			else
				mode = :left
			end
			
		end

		print_grid

		total = 0
		(0..@size - 1).each do |i|
			total += @grid[i][i]
			if @size - i - 1 != i
				total += @grid[i][@size - i - 1]
			end
		end	
		puts total
				
		puts Time.new
	end

	def set(x, y, c)
		c -= 1
		@grid[y][x] = c
		c
	end

	def check(x, y, dx, dy)
		if dx < 0 && x > 0 
			return @grid[y][x - 1] == 0
		end
		if dx > 0 && x < @size - 1
			return @grid[y][x + 1] == 0
		end
		if dy < 0 && y > 0
			return @grid[y - 1][x] == 0
			return true
		end
		if dy > 0 && y < @size - 1
			return @grid[y + 1][x] == 0
		end
	end
			
	def has_exits(x, y)
		return check(x, y, -1, 0) || check(x, y, 1, 0) || check(x, y, 0, -1) || check(x, y, 0, 1)
	end

	def print_grid
		(0..@size - 1).each do |y|
			puts @grid[y].to_s
		end
	end

end

if __FILE__ == $0
	p = Pe.new
	p.start
end
