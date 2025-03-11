# frozen_string_literal: true

require 'net/http'
require 'json'

# Class responsible for fetching data about USD, EUR and BRL
class ExchangeRateFetcher
  API_URL = 'https://economia.awesomeapi.com.br/last/USD-BRL,EUR-BRL,BTC-BRL'

  def self.fetch
    response = Net::HTTP.get(URI(API_URL))
    JSON.parse(response)
  rescue StandardError => e
    puts "Erro ao obter as cotações: #{e.message}"
    {}
  end
end
