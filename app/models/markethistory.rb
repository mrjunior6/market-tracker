class Markethistory
    attr_reader :id, :timestamp, :quantity, :price, :total, :filltype, :ordertype

    def initialize(market, attrs = {})
      @market = market
      @id = attrs['Id']
      @timestamp = attrs['TimeStamp']
      @quantity = attrs['Quantity']
      @price = attrs['Price']
      @total = attrs['Total']
      @filltype = attrs['FillType']
      @ordertype = attrs['OrderType']
    end

    # Example:
    # Bittrex::Quote.current('BTC-HPY')
    def self.current(market)
      new(market, client.get('public/getmarkethistory', market: market))
    end

    private

    def self.client
      @client ||= Bittrex::Client
    end
end

