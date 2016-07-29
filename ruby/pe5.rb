class Pe5 

	def start
		puts Time.new
		@divisors = (2..20).to_a
		#for i in 1..1000000000	
		(10..1000000000).step(10).each do |i|
			s = i.to_s
			if s[s.length - 1] == "0" && is_evenly_divisible(i)
				puts i
				puts Time.new
				break
			end		
		end
	end

	def is_evenly_divisible(candidate)
		@divisors.reverse_each { |j|
			if candidate % j != 0
				return false
			end
		}
		true
	end
		
end

if __FILE__ == $0
	Pe5.new.start
end
