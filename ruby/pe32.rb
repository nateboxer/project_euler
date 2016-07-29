class Pe
	
	def start
		puts Time.new

		numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9]

		# 123456789
		# 1x234=56789 [0, 1] + x + [1,3] + = + [4,10]
		# 1x2345=6789 [0, 1] + x + [1,4] + = + [5,10]
		# 12x34=56789 [0, 2] + x + [2,2] + = + [4,10] 
		# 12x345=6789 [0, 2] + x + [2,3] + = + [5,10]
 		# 123x4=56789 inverted
		# 123x45=6789 inverted
		# 1234x5=6789 inverted
		# 123x456=789 [0,3] + x + [3,3] + = + [6, 10]

		# positions of x and =
		pos = Array.new
		pos[0] = [0, 1, 1, 3, 4]
		pos[1] = [0, 1, 1, 4, 5]
		pos[2] = [0, 2, 2, 2, 4]
		pos[3] = [0, 2, 2, 3, 5]
		pos[4] = [0, 3, 3, 3, 6]
			
		@perms = Array.new

		puts "Finding numeric perms..."
		find_perms(numbers, [])

		puts "Parsing equations..."
		s = ""
		p = []
		n1 = 0
		n2 = 0
		n3 = 0
		sum = 0
		(0..pos.length - 1).each do |i|
			(0..@perms.length - 1).each do |j|
				s = @perms[j]
				p = pos[i]
				n1 = (s[p[0], p[1]]).to_i
				n2 = (s[p[2], p[3]]).to_i
				n3 = (s[p[4], 10]).to_i
				if n1 * n2 == n3
					puts n1.to_s + " x " + n2.to_s + " = " + n3.to_s
					sum += n3
				end	
			end
		end

		puts sum

		puts Time.new
	end

	def find_perms(numbers, perm)
		if perm.length == 9
			#puts perm.to_s
			@perms.push(perm.join(""))
			return
		end
		(0..numbers.length - 1).each do |i|
			smaller = numbers.dup
			p =	smaller.delete_at(i)
			perm_new = perm.dup
			perm_new.push(p)
			find_perms(smaller, perm_new)
		end			
	end

end

if __FILE__ == $0
	p = Pe.new
	p.start
end
