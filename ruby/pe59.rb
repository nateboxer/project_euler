class Pe
	
	def start
		puts Time.new

		file = File.new("cipher1.txt", "r")
		line = file.gets
		nums = line.split(",")
		nums.map! { |i| i = i.to_i }
=begin	
		min = 97
		max = 122
		range = (min..max)
		range.each do |a|
			range.each do |b|
				range.each do |c|
					i = 0
					while i < nums.length - 3 do
						set = nums[i, 3]
						set[0] ^= a
						set[1] ^= b
						set[2] ^= c
					
						s = set[0].chr + set[1].chr + set[2].chr
						if s == "the"
							decode([a, b, c], nums)	
						end
							
						i += 3
					end
				end
			end
		end
=end
		key = "god".split('').map(&:ord)
		s = decode(key, nums)
		sum = 0
		(0..s.length - 1).each do |i|
			sum += s[i].ord
		end
		puts sum
				
		puts Time.new
	end

	def decode(key, nums)
		puts ""
		puts ""
		puts "Decoding with key: " + key[0].chr + ", " + key[1].chr + ", " + key[2].chr
		puts ""
		s = ""
		j = 0
		(0..nums.length - 1).each do |i|
			s += (nums[i] ^ key[j]).chr	
			j += 1
			if j > 2
				j = 0
			end	
		end
		puts s
		return s
	end

end

if __FILE__ == $0
	p = Pe.new
	p.start
end
