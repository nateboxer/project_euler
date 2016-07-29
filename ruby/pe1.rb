class Pe1 
	def start
		sum = 0
		for i in 1..999
			if i % 3 == 0 || i % 5 == 0
				sum = sum + i
			end
		end
		puts sum
	end
end

if __FILE__ == $0
	Pe1.new.start
end
