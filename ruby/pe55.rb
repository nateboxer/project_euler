class Pe 

	def start
		puts Time.now

		ly_count = 0
		(0..9999).each do |i|
			num = i
			lychrel = true
			(1..50).each do |j|
				rev = num.to_s.reverse.to_i
				num = num + rev
				if is_palindrome(num)
					puts i.to_s + " (" + j.to_s + ")--> " + num.to_s		
					lychrel = false
					break
				end
			end
			if lychrel
				puts i.to_s + " is lychrel"
				ly_count += 1
			end
		end

		puts ly_count.to_s + " lychrels"

		puts Time.now
	end

	def is_palindrome(product)
		s = product.to_s
		limit = (s.length / 2).floor
		for i in 0..limit
			if s[i] != s[s.length - i - 1]
				return false
			end
		end
		return true
	end

end

if __FILE__ == $0
	Pe.new.start
end
