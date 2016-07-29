class Pe4 

	def start
		puts "starting..."
		largest = 0
		a = (1..999).to_a
		a.reverse_each { |i|
			a.reverse_each { |j|
				product = i * j
				if is_palindrome(product)
					if product > largest
						largest = product
						puts product
					end
				end
			}	
		}	
	end

	def is_palindrome(product)
		s = product.to_s
		limit = (s.length / 2).floor
		for i in 0..limit
			if s[i] != s[s.length - i - 1]
				return false
			end
		end
		true
	end

end

if __FILE__ == $0
	Pe4.new.start
end
