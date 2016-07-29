class Pe10

	def start
		puts Time.new
		@limit = 2000000
		@sublimit = Math.sqrt(@limit) 
		sum = 0
		for i in 2..@limit do
			if test_prime(i)
				sum += i
			end
		end

		puts sum

		puts Time.new
	end

	def test_prime(candidate)
		if candidate > 2
			for i in 2...@sublimit do
				if candidate % i == 0 && candidate != i		
					return false
				end
			end
		end
		true
	end

end

if __FILE__ == $0
	p = Pe10.new
	p.start
end
