require 'bigdecimal'

class Pe
	
	def start
		puts Time.new

		@prec = 100000
		@max_size = 5000
		@num_times = 5

		nom = BigDecimal("1.0")

		longest = ""
		denom = 1
		(983..983).each do |i|

			test = BigDecimal(i.to_s)
			f = nom.div(test, @prec) 

			digits = f.to_s("F")

			puts i.to_s + " = " + digits[0..999]

			digits = digits.split(".")[1]

			s = get_repeating(digits, 100)

			puts "(" + s + ")"

			if s.length > longest.length
				longest = s
				denom = i
			end
		end

		puts "tada!"
		puts denom
		puts "(" + longest + ")"
		puts "length = " + longest.length.to_s

		puts Time.new
	end

	def get_repeating(f, size)

		seq = ""
		found = 0
		(0..(f.length - (size * 2))).each do |i|
			r, check_again = check_at(f, i, size)	
			if r.length > 0 
				found += 1
				if found >= @num_times 
					seq = r
					break
				end
			end
			if !check_again
				break
			end
		end	

		if seq == "" && size <= @max_size 
			seq = get_repeating(f, size + 1)
		end

		seq

	end

	def check_at(f, i, size)
		if i + (size * 2) >= f.length
			return "", false
		end
		lim = i + size
		p1 = f[i..lim]
		lim += 1 
		p2 = f[lim..lim + size]
		if p1 != p2
			return "", true
		end
		return p1, true
	end

end

if __FILE__ == $0
	p = Pe.new
	p.start
end
