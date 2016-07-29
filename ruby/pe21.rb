class Pe
	
	def start
		puts Time.new

		nums = Array.new
		(2..9999).each do |i|
			s = sum_factors(i)
			#puts i.to_s + " = " + get_factors(i).to_s + " = " + s.to_s

			ss = sum_factors(s)
			if ss == i && s != i 
				puts i.to_s + ": " + s.to_s + " = " + i.to_s
				if !nums.include?(i)
					nums.push(i)
				end
			end
		end

		puts nums.to_s

		puts nums.reduce(:+).to_s
	
		puts Time.new
	end

	def sum_factors(n)
		get_factors(n).reduce(:+)
	end

	def get_factors(n)
		factors = Array.new
		limit = (n / 2).ceil
		(1..limit).each do |c|
			if n % c == 0
				factors.push(c)
			end
		end
		factors
	end

end

if __FILE__ == $0
	p = Pe.new
	p.start
end
