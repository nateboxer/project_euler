class Pe2 
	def start
        eta = Time.new

		sum = 0

		num1 = 1
		num2 = 2
		until num2 > 4000000
			if num2 % 2 == 0
				sum = sum + num2
			end
			temp = num2
			num2 = num1 + num2
			num1 = temp
		end
			
		puts sum

        puts Time.new - eta
	end
end

if __FILE__ == $0
	Pe2.new.start
end
