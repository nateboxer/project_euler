class Pe
	
	def start
		puts Time.new

		primes = Array.new
		(1000..9999).each do |i|
			if is_prime(i)
				primes.push(i.to_s)
			end
		end
		puts "found " + primes.length.to_s + " primes"

		primes.each do |prime|
			perms = get_perms(prime, primes)

			s = ""
			yay = false
			if perms.length > 2
				triplets = get_triplets(perms, [], perms.dup, [])		

				triplets.each do |triplet|
					if (triplet[2].to_i - triplet[1].to_i) ==
						(triplet[1].to_i - triplet[0].to_i)
						puts (triplet[2].to_i - triplet[1].to_i).to_s + triplet.to_s
						puts triplet[0] + triplet[1] + triplet[2]
					end
				end
			end
		end

		puts Time.new
	end

	def get_triplets(perms, triplet, remaining, triplets)
		if perms.length == 3
			triplets.push(perms.dup)
			return triplets 
		end

		if triplet.length == 3
			triplets.push(triplet)
			return triplets
		end
		
		if remaining.length < 1
			return triplets
		end

		(0..remaining.length - 1).each do |i|
			new_remaining = remaining.dup
			new_remaining.slice!(0, i + 1)
			new_triplet = triplet.dup
			new_triplet.push(remaining[i])
			get_triplets(perms, new_triplet, new_remaining, triplets)
		end
		return triplets
	end

	def get_perms(prime, primes)
		perms = Array.new
		(0..primes.length - 1).each do |i|
			if is_perm(prime, primes[i])
				perms.push(primes[i])
			end
		end
		return perms
	end

	def is_perm(i, j)
		p = 
			i.include?(j[0]) &&
			i.include?(j[1]) &&
			i.include?(j[2]) &&
			i.include?(j[3]) &&
			j.include?(i[0]) &&
			j.include?(i[1]) &&
			j.include?(i[2]) &&
			j.include?(i[3])
		return p
	end

	def is_prime(i)
		(2..Math.sqrt(i)).each do |j|
			if i % j == 0
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
