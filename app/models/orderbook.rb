class Orderbook
	attr_reader :quantity, :rate, :raw

	$order = {}

	def initialize(attrs = {})
      @quantity    = attrs['Quantity']
      @rate        = attrs['Rate']
    end

    def self.orders(market)
    	math(market)
    	#puts $order
    	return $order
    end


	private
	def self.check(market,type)
		data = Bittrex::Order.orderbook(market,type,10)
		$order[type] = data.count
		return data.map{|data| new(data) }
	end

	def self.math(market)

		buy_qtd = 0.0
		buy_rate = 0.0

		sell_qtd = 0.0
		sell_rate = 0.0

		check(market,"buy").map.each {|x| 
    		buy_qtd += x.quantity
    		buy_rate += x.rate }

    		$order["buy_qtd"] = buy_qtd
    		$order["buy_rate"] = buy_rate

    	
    	check(market,"sell").map.each {|y| 
    		sell_qtd += y.quantity
    		sell_rate += y.rate }
     		$order["sell_qtd"] = sell_qtd
    		$order["sell_rate"] = sell_rate 		

	end


end

