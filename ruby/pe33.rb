class Pe
	
	def start
		puts Time.new

		# cache factors
		factors = Array.new
		(10..99).each do |i|
			factors[i] = get_factors(i)
		end

		@fractions = Array.new

		(10..99).each do |i|
			(10..99).each do |j|
				#puts i.to_s + "/" + j.to_s
				if i != j && i < j
					num = i.to_s
					denom = j.to_s
					if num[1] != "0" || denom[1] != "0"

						if num[0] == denom[0]
							check_pair(i, j, 1, 1)
						end
						if num[0] == denom[1]
							check_pair(i, j, 1, 0)
						end
						if num[1] == denom[1]
							check_pair(i, j, 0, 0)
						end
						if num[1] == denom[0]
							check_pair(i, j, 0, 1)
						end

					end
				end	
			end
		end

		puts Time.new
	end

	def check_pair(p1, p2, c1, c2)
		n1 = p1.to_s[c1].to_f
		n2 = p2.to_s[c2].to_f	
		if p1.to_f / p2.to_f == n1 / n2
			puts p1.to_s + "/" + p2.to_s + " " + n1.to_s + "/" + n2.to_s
			@fractions.push(n1/n2)
		end
	end

	def find_matching(f1, f2)
		matching = Array.new
		f1.each do |i|
			f2.each do |j|
				if i == j
					matching.push(i)
				end 
			end
		end		
		return matching 
	end

	def get_factors(num)
		factors = Array.new
		(2..num - 1).each do |i|
			if num % i == 0
				factors.push(i)
			end
		end
		return factors
	end

end

if __FILE__ == $0
	p = Pe.new
	p.start
end
