class Stock < ApplicationRecord

	def self.find_by_ticker(ticker_symbol)
		where(ticker: ticker_symbol).first
	end

	def self.new_from_lookup(ticker_symbol)
		looked_up_stock = Bittrex::Quote.current(ticker_symbol)
		return nil unless looked_up_stock.market

		coinName = findname(ticker_symbol)
		new_stock = new(ticker: looked_up_stock.market.upcase, name: coinName)
		#new_stock.name = findname(ticker_symbol)
		new_stock.last_price = new_stock.price
		new_stock
	end

	def price
		last_price = Bittrex::Quote.current(ticker).last
		last_price = ("%f" % last_price).to_f
		#last_price = helper.number_with_delimiter(last_price, :deliter => ",", :separator => ".")
		return last_price
	end

	def self.findname(ticker)
		str = ""
		coin = ticker.split('-')[1]		
		var = Bittrex::Currency.all
		var.collect.each_with_index {|key,index| (str = key.name ) if key.abbreviation == coin.upcase }
		return str
	end


end
