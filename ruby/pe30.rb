class Pe
	
	def start
		puts Time.new

		all = 0
		(10..9999999).each do |i|
			
			sum = 0
			s = i.to_s
			(0..s.length - 1).each do |j|
				sum += s[j].to_i ** 5
			end

			if i == sum
				all += i
				puts i
			end

		end

		puts "all: " + all.to_s
				
				
		puts Time.new
	end

end

if __FILE__ == $0
	p = Pe.new
	p.start
end
