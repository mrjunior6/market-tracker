class Stock < ApplicationRecord

	def self.find_by_ticker(ticker_symbol)
		where(ticker: ticker_symbol).first
	end

	def self.new_from_lookup(ticker_symbol)
		looked_up_stock = Bittrex::Quote.current(ticker_symbol)
		return nil unless looked_up_stock.market

		new_stock = new(ticker: looked_up_stock.market, name: looked_up_stock.market)
		new_stock.last_price = new_stock.price
		new_stock
	end

	def price
		last_price = Bittrex::Quote.current(ticker).last
		return last_price
	end


end
