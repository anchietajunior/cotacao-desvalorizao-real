require 'net/http'
require 'json'

def fetch_exchange_rates
  url = URI('https://economia.awesomeapi.com.br/last/USD-BRL,EUR-BRL,BTC-BRL')
  response = Net::HTTP.get(url)
  JSON.parse(response)
end

def compare_currencies(data)
  usd_brl = data['USDBRL']['bid'].to_f
  eur_brl = data['EURBRL']['bid'].to_f

  puts "Cotação Atual e verificação da desvalorização do REAL na data de hoje:"
  puts "1 USD = #{usd_brl.round(4)} BRL"
  puts "1 EUR = #{eur_brl.round(4)} BRL"
  puts ""
  
  puts "Comparação entre moedas:"
  puts "1 EUR equivale a #{(eur_brl / usd_brl).round(4)} USD"
  puts "1 USD equivale a #{(usd_brl / eur_brl).round(4)} EUR"
  puts ""
end

def compare_common_values(data)
  usd_brl = data['USDBRL']['bid'].to_f
  eur_brl = data['EURBRL']['bid'].to_f

  puts "Valores comuns convertidos de dólar para real:"
  puts "100 USD = #{usd_brl.round(2) * 100} BRL"
  puts "500 USD = #{usd_brl.round(2) * 500} BRL"
  puts "1000 USD = #{usd_brl.round(2) * 1000} BRL"
  puts ""

  puts "Valores comuns convertidos de euro para real:"
  puts "100 EUR = #{eur_brl.round(2) * 100} BRL"
  puts "500 EUR = #{eur_brl.round(2) * 500} BRL"
  puts "1000 EUR = #{eur_brl.round(2) * 1000} BRL"
  puts ""
end

begin
  data = fetch_exchange_rates
  compare_currencies(data)
  compare_common_values(data)
rescue StandardError => e
  puts "Erro ao obter as cotações: #{e.message}"
end
