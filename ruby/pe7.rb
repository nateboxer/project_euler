class Prime

	def start
		puts Time.new
		@limit = 1000000
		@sublimit = Math.sqrt(@limit) 
		found_count = 0
		for i in 2..@limit do
			if test_prime(i)
				puts i.to_s
				found_count += 1
				if found_count == 10001
					break
				end
			end
		end
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
	p = Prime.new
	p.start
end
