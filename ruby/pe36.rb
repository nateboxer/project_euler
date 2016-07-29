class Pe
	
	def start
		puts Time.new

		sum = 0
		(1..999999).each do |i|
			b10 = is_pal(i.to_s)
			b2 = is_pal(i.to_s(2))
			if b10 && b2
				puts i.to_s + " = " + i.to_s(2)
				sum += i
			end
		end
		puts sum

		puts Time.new
	end

	def is_pal(s)
		end_index = s.length - 1
		start_index = 0
		while start_index != end_index && start_index < end_index
			if s[start_index] != s[end_index]
				return false
			end
			start_index += 1
			end_index -= 1
		end
		return true 
	end

end

if __FILE__ == $0
	p = Pe.new
	p.start
end
