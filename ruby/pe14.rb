class Pe
	
	def start
		puts Time.new


		longest = 0
		(2..999999).each do |i|
			f = count_collatz(i, 1)
			if f > longest
				longest = f
				puts i.to_s + " " + f.to_s
			end
		end

		puts Time.new
	end

	def count_collatz(n, count)
		if n == 1
			return count
		end
		if n % 2 == 0
			n = n / 2
		else
			n = (3 * n) + 1
		end
		count += 1
		count_collatz(n, count)
	end

end

if __FILE__ == $0
	p = Pe.new
	p.start
end
