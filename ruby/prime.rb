class Prime

	def start
		unless ARGV[0].nil?
			puts "Finding primes up to " + ARGV[0].to_s	
			find_primes(ARGV[0].to_i)
		end
	end

	def find_primes(limit)
		@limit = limit
		@sublimit = Math.sqrt(@limit) 
		for i in 1..@limit do
			if test_prime(i)
				puts i.to_s
			end
		end
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
	p = Prime.new
	p.start
end
