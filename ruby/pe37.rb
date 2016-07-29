class Pe
	
	def start
		puts Time.new

		puts "finding primes..."
		@primes = Hash.new
		@primes[2] = true
		count = 3
		while count <= 1000000 do
			if is_prime(count)
				@primes[count] = true
				#print count.to_s + ", "
			end
			count += 2
		end
		puts "found " + @primes.size.to_s + " primes"
			
		puts Time.new
		puts "finding truncs..."
		sum = 0
		count = 0
		@primes.each_key do |i|
			if i > 7
				rots = get_rots(i)
				rots_are_prime = true
				rots.each do |j|
					if !@primes[j.to_i]
						rots_are_prime = false 
						break	
					end
				end
				if rots_are_prime
					count += 1
					puts count.to_s + ": " + i.to_s
					sum += i
				end
			end
		end

		puts sum 

		puts Time.new
	end

	def get_rots(num)
		rots = Array.new
		s1 = num.to_s
		s2 = num.to_s
		while s1.length > 1 
			s1 = s1[0, s1.length - 1]
			s2 = s2[1, s2.length]
			rots.push(s1)
			rots.push(s2)
		end
		return rots
	end

	def is_prime(num)
		lim = Math.sqrt(num)
		if lim >= @primes.length
			lim = @primes.length - 1
		end
		@primes.each_key do |i|
			if i > lim
				break
			end
			if num % i == 0 && num != i
				return false
			end
		end
		return true
	end

end

if __FILE__ == $0
	p = Pe.new
	p.start
end
