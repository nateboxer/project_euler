class Pe
	
	def start
		puts Time.new

		bouncy = 0.0
		(1..10000000).each do |i|
			if i < 100
				next
			end
			s = i.to_s
			found_inc = false
			found_dec = false
			(1..s.length - 1).each do |j|
				if s[j - 1] < s[j]
					found_inc = true
					if found_dec
						break
					end
				elsif s[j - 1] > s[j]
					found_dec = true
					if found_inc
						break
					end
				end
			end	
			if found_inc && found_dec
				bouncy += 1
			end
			perc = bouncy / i
			if perc >= 0.99
				puts i.to_s + ": " + bouncy.to_s + " / " + i.to_s + " = " + (bouncy / i).to_s
				break
			end
		end	

		puts Time.new
	end			

end

if __FILE__ == $0
	p = Pe.new
	p.start
end
