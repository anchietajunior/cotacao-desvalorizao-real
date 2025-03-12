# frozen_string_literal: true

require 'sinatra'
require 'sinatra/activerecord'
set :database_file, 'config/database.yml'

require_relative 'lib/exchange_rate_fetcher'
require_relative 'lib/exchange_rate_comparator'
require_relative 'models/exchange_rate'

set :bind, '0.0.0.0'

get '/' do
  data = ExchangeRateFetcher.fetch
  comparator = ExchangeRateComparator.new(data)

  usd = data.dig('USDBRL', 'bid').to_f
  eur = data.dig('EURBRL', 'bid').to_f
  brl = 1.0 # Considerando BRL como referência

  today = Date.today
  exchange_rate = ExchangeRate.find_or_initialize_by(date: today)
  exchange_rate.update(usd: usd, eur: eur, brl: brl)

  @currency_comparison = comparator.compare_currencies
  @common_values = comparator.compare_common_values

  erb :index
end
