require 'net/http'
require 'json'

class LatestStockPrice
  BASE_URL = 'https://latest-stock-price.p.rapidapi.com'

  def self.price(symbol)
    response = request("/price?symbol=#{symbol}")
    JSON.parse(response.body)['price']
  end

  def self.prices(symbols)
    response = request("/prices?symbols=#{symbols.join(',')}")
    JSON.parse(response.body)
  end

  def self.price_all
    response = request('/price_all')
    JSON.parse(response.body)
  end

  private

  def self.request(endpoint)
    uri = URI(BASE_URL + endpoint)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    request = Net::HTTP::Get.new(uri)
    request['X-RapidAPI-Key'] = ENV['RAPIDAPI_KEY']
    http.request(request)
  end
end
