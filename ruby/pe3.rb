class Pe3 
	def start
		top = 0
		num = 600851475143
		primes = find_primes(Math.sqrt(num))

		puts "factoring " + num.to_s
		primes.each do |prime|
			if num % prime == 0
				puts prime
				if prime > top
					top = prime 
				end
			end
		end
		puts top.to_s
	end
	
	def find_primes(num)
		puts "finding primes"
		primes = Array.new
		for i in 1..num do
			if is_prime(i)
				primes.push(i)
				#puts i
			end
		end
		return primes
	end	

	def is_prime(candidate)
		if candidate % 2 == 0
			return false
		end
		limit = Math.sqrt(candidate)
		for i in 2..limit do
			if candidate % i == 0 && i != candidate
				return false
			end
		end
		return true
	end
end

if __FILE__ == $0
	Pe3.new.start
end
