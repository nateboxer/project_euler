class Pe6 

	def start
		puts Time.new

		square_sum = 0
		sum_square = 0

		(1..100).each do |i|
			square_sum += i
			sum_square += i * i
		end

		square_sum **= 2
		puts square_sum	

		puts sum_square

		puts (square_sum - sum_square)
	end
		
end

if __FILE__ == $0
	Pe6.new.start
end
