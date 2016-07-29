class Pe
	
	def start
		puts Time.new

		# 1..999 x [1], [1,2], [1,2,3] ... = 123456789

		(1..99999).each do |i|
			(2..9).each do |j|
				products = ""
				(1..j).each do |k|
					products += (i * k).to_s
					if products.length > 9
						break
					end
				end
				if products.length == 9 &&
					products.index("1") &&
					products.index("2") &&
					products.index("3") &&
					products.index("4") &&
					products.index("5") &&
					products.index("6") &&
					products.index("7") &&
					products.index("8") &&
					products.index("9") 
					puts i.to_s + ": [" + j.to_s + "] " + products
				end
			end	
		end

		puts Time.new
	end

end

if __FILE__ == $0
	p = Pe.new
	p.start
end
