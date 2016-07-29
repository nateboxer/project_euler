require 'bigdecimal'

class Pe
	
	def start
		puts Time.new

		# n2 + an + b
		# a, b in -999..999

		@max = 999 

		best_a = 0
		best_b = 0
		best_count = 0
		best_primes = nil
		(-@max..@max).each do |a|
			(-@max..@max).each do |b|
				count = 0
				primes = Array.new
				(0..@max).each do |n|
					result = (n**2) + (a*n) + b
					if !is_prime(result)
						break
					end
					count += 1
					primes.push(result.abs)
				end
				if count > best_count
					best_a = a
					best_b = b
					best_count = count
					best_primes = primes
				end
			end
		end

		puts "n2 + " + best_a.to_s + "n + " + best_b.to_s
		puts best_primes.to_s
		puts "num primes = " + best_primes.length.to_s
		puts (best_a * best_b)

		puts Time.new
	end

	def is_prime(c)
		if c.abs == 1
			return false
		end
		lim = Math.sqrt(c.abs)
		(2..lim).each do |i|
			if c % i == 0
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
