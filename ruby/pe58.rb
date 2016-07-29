class Pe

	@primes
	@largest
		
	def start
		puts Time.new

		puts "gen primes..."
		@primes = Hash.new
		@primes[2] = true
		@largest = 2
		gen_primes_up_to(10000000)
		
		puts "checking sizes..."
		percent = 100
		i = 7001 
		while percent >= 10.0 do
			puts "testing size = " + i.to_s 
			percent = test_grid(i)

			#change back to 2 when we're close!
			i += 500 
		end

		puts Time.new
	end

	def gen_primes_up_to(size)
		i = @largest + 1
		#puts "finding primes between " + i.to_s + " and " + size.to_s
		while i <= size do
			if check_prime(i)
				@primes[i] = true
				@largest = i
			end
			i += 1
		end
		puts "largest prime = " + @largest.to_s
	end

	def check_prime(num)
		(2..(Math.sqrt(num) + 1)).each do |i|	
			if num % i == 0
				return false
			end
		end
		return true
	end

	def test_grid(size)
		@size = size 
		@grid = Array.new(@size) {Array.new(@size) {|i| 0}}

		x = @size - 1
		y = 0 
		c = @size * @size 
		puts "largest num = " + c.to_s
		if c > @largest
			puts "generating more primes..."
			gen_primes_up_to(c + (size * 4))
		end

		puts "generating grid of size " + size.to_s
		@grid[y][x] = c
		mode = :right
		while has_exits(x, y) 
			if check(x, y, 1, 0) && mode == :left
				x += 1
				c = set(x, y, c)
			else
				mode = :down
			end
			if check(x, y, 0, -1) && mode == :down
				y -= 1
				c = set(x, y, c)
			else
				mode = :right
			end
			if check(x, y, -1, 0) && mode == :right
				x -= 1
				c = set(x, y, c)
			else
				mode = :up
			end
			if check(x, y, 0, 1) && mode == :up
				y += 1
				c = set(x, y, c)
			else
				mode = :left
			end
		end
		#print_grid

		total = 0.0
		nonprimes = 0.0
		(0..@size - 1).each do |i|
			if @primes[@grid[i][i]]
				total += 1 
			end
			nonprimes += 1
			if @size - i - 1 != i
				if @primes[@grid[i][@size - i - 1]]
					total += 1 
				end
				nonprimes += 1
			end
		end	
		puts total.to_s + "/" + nonprimes.to_s + " = " + (total / nonprimes * 100).to_s + "%"
			
		return total / nonprimes * 100	
	end

	def set(x, y, c)
		c -= 1
		@grid[y][x] = c
		c
	end

	def check(x, y, dx, dy)
		if (dx < 0 && x > 0) || 
			(dx > 0 && x < @size - 1)
			return @grid[y][x + dx] == 0
		end
		if (dy < 0 && y > 0) ||
			(dy > 0 && y < @size - 1)
			return @grid[y + dy][x] == 0
		end
		return false
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
