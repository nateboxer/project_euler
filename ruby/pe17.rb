class Pe
	
	def start
		puts Time.new

		@one = "one"
		@two = "two"
		@three = "three"
		@four = "four"
		@five = "five"
		@six = "six"
		@seven = "seven"
		@eight = "eight"
		@nine = "nine"

		@not = ""
		@ten = "ten"
		@twenty = "twenty"
		@thirty = "thirty" 
		@forty = "forty"
		@fifty = "fifty"
		@sixty = "sixty"
		@seventy = "seventy"
		@eighty = "eighty"
		@ninety = "ninety"

		@and = "and"
		@hundred = "hundred"
		@thousand = "thousand"
		
		@zero_nine = [@not, @one, @two, @three, @four, @five, @six, @seven, @eight, @nine]
		@not_ninety = [@not, @ten, @twenty, @thirty, @forty, @fifty, @sixty, @seventy, @eighty, @ninety]
		
		@special = ["eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen", "seventeen", "eighteen", "nineteen"]
			
		count = 0
		
		num = @one 
		tens = 0
		tensIndex = 0 
		hundreds = 0
		hundredsIndex = 0
		(1..999).each do |i|

			tensIndex += 1
			if tensIndex > 9 
				tensIndex = 0
				tens += 1
				if tens > 9
					tens = 0
				end
			end

			hundredsIndex += 1
			if hundredsIndex > 99
				hundreds += 1
				hundredsIndex = 0
			end

			num = ""
			if (i > 99)
				num = @zero_nine[hundreds] + @hundred + ((i % 100 == 0) ? "" : @and) 
			end

			if (tens == 1) && (tensIndex > 0)
				num += @special[tensIndex - 1]
			else
				num += @not_ninety[tens] + @zero_nine[tensIndex] 
			end

			count += num.length

			puts i.to_s + ": " + num + " (" + count.to_s + ")"  

		end

		count += "onethousand".length
		puts "1000: onethousand (" + count.to_s + ")"
		
		puts "Total: " + count.to_s

		puts Time.new
	end

end

if __FILE__ == $0
	p = Pe.new
	p.start
end
