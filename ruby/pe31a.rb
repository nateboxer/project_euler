class Pe
	
	def start
		puts Time.new

		coins = [1, 2, 5, 10, 20, 50, 100, 200]

		puts count(coins, 200)

		puts Time.new
	end

	def count(coins, amount)
		return 1 if amount == 0
		return 0 if amount < 0 || coins.length == 0

		coin, *rest = coins
		balance = amount - coin

		return count(coins, balance) + count(rest, amount)
	end

end

if __FILE__ == $0
	p = Pe.new
	p.start
end
