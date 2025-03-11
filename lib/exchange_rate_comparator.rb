# frozen_string_literal: true

# Class responsible for generating data and comparing exchanges
class ExchangeRateComparator
  def initialize(data)
    @data = data
  end

  def compare_currencies
    usd_brl = @data.dig('USDBRL', 'bid').to_f
    eur_brl = @data.dig('EURBRL', 'bid').to_f

    {
      usd_to_brl: usd_brl.round(4),
      eur_to_brl: eur_brl.round(4),
      eur_to_usd: (eur_brl / usd_brl).round(4),
      usd_to_eur: (usd_brl / eur_brl).round(4)
    }
  end

  def compare_common_values
    usd_brl = @data.dig('USDBRL', 'bid').to_f
    eur_brl = @data.dig('EURBRL', 'bid').to_f

    {
      usd_common: {
        '100 USD' => (usd_brl * 100).round(2),
        '500 USD' => (usd_brl * 500).round(2),
        '1000 USD' => (usd_brl * 1000).round(2)
      },
      eur_common: {
        '100 EUR' => (eur_brl * 100).round(2),
        '500 EUR' => (eur_brl * 500).round(2),
        '1000 EUR' => (eur_brl * 1000).round(2)
      }
    }
  end
end
