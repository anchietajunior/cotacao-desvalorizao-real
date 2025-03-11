# frozen_string_literal: true

require 'sinatra'
require_relative 'lib/exchange_rate_fetcher'
require_relative 'lib/exchange_rate_comparator'

get '/' do
  data = ExchangeRateFetcher.fetch
  comparator = ExchangeRateComparator.new(data)

  @currency_comparison = comparator.compare_currencies
  @common_values = comparator.compare_common_values

  erb :index
end
