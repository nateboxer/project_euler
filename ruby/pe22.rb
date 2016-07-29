class Pe
	
	def start
		puts Time.new

		file = File.new("names.txt", "r")
		line = file.gets
		line.delete!("\"")
		line.downcase!
		names = line.split(",")
		names.sort!
			
		alpha = "abcdefghijklmnopqrstuvwxyz"
		val = Hash[*(alpha.split('').zip((1..26)).flatten)]

		order = 1
		count = 0
		(0..(names.length - 1)).each do |i|
			name = names[i]
			(0..(name.length - 1)).each do |j|
				count += val[name[j]].to_i * order
			end
			order += 1
		end

		puts count

		puts Time.new
	end

end

if __FILE__ == $0
	p = Pe.new
	p.start
end
