class Pe
	
	def start
		puts Time.new

		numbers = [1, 2, 3, 4, 5, 6, 7]

		@perms = Array.new

		puts "Finding numeric perms..."
		find_perms(numbers, [])

		(0..@perms.length - 1).reverse_each do |i|
			puts @perms[i]
			if is_prime(@perms[i].to_i)
				puts "WINNER " + @perms[i] 
				break
			end
		end

		puts Time.new
	end

	def is_prime(i)
		(2..Math.sqrt(i)).each do |j|
			if i % j == 0
				return false
			end
		end
		return true
	end	

	def find_perms(numbers, perm)
		if perm.length == 7
			#puts perm.to_s
			@perms.push(perm.join(""))
			return
		end
		(0..numbers.length - 1).each do |i|
			smaller = numbers.dup
			p =	smaller.delete_at(i)
			perm_new = perm.dup
			perm_new.push(p)
			find_perms(smaller, perm_new)
		end			
	end

end

if __FILE__ == $0
	p = Pe.new
	p.start
end
