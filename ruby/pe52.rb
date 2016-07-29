class Pe
	
	def start
		puts Time.new

		(1..1000000).each do |i|
			if are_same_length(i*2, i*3) &&
				are_same_length(i*2, i*4) &&
				are_same_length(i*2, i*5) &&
				are_same_length(i*2, i*6)
				if have_same_digits(i*2, i*3) &&
					have_same_digits(i*2, i*4) &&
					have_same_digits(i*2, i*5) &&
					have_same_digits(i*2, i*6)
					puts i
					puts (i*2).to_s + 
						" " + (i*3).to_s +
						" " + (i*4).to_s +
						" " + (i*5).to_s +
						" " + (i*6).to_s
					break
				end
			end
		end

		puts Time.new
	end

	def are_same_length(n1, n2)
		return n1.to_s.length == n2.to_s.length
	end

	def have_same_digits(n1, n2)
		s1 = n1.to_s
		s2 = n2.to_s
		(0..s1.length - 1).each do |i|
			c = s2.index(s1[i])
			if c.nil?
				return false
			end
			s2.slice!(c)
		end
		return true	
	end

end

if __FILE__ == $0
	p = Pe.new
	p.start
end
