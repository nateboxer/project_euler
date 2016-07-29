class Pe 

	def start
		puts Time.now

		largest = 0
		(1..99).each do |a|
			(1..99).each do |b|
				sum = sum_num(a**b)
				if sum > largest
					puts sum
					largest = sum
				end
			end
		end		

		puts Time.now
	end

	def sum_num(num)
		s = num.to_s
		sum = 0
		(0..s.length - 1).each do |i|
			sum += s[i].to_i
		end
		return sum
	end

end

if __FILE__ == $0
	Pe.new.start
end
