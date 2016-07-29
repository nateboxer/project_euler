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
			end
			count += 2
		end
		puts "found " + @primes.size.to_s + " primes"
			
		puts Time.new
		puts "finding circs..."
		count = 0
		@primes.each_key do |p|
			if is_circ(p)
				count += 1 
				puts count.to_s + ": " + p.to_s
			end
		end
		puts count

		puts Time.new
	end

	def is_circ(num)
		if num < 10
			return true
		end

		set = num.to_s.split("")
		perms = Array.new
		(0..set.length - 1).each do |i|
			a = Array.new
			a_index = i
			a_count = 0
			while a.length < set.length do
				a[a_count] = set[a_index]
				a_index += 1
				a_count += 1
				if a_index >= set.length
					a_index = 0
				end
			end
			perms.push(a)
		end			

		(0..perms.length - 1).each do |i|
			perm = perms[i].join.to_i
			if num != perm && @primes[perm] == nil
				return false
			end
		end
		
		return true 
	end

	def is_prime(num)
		(2..Math.sqrt(num)).each do |i|
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
