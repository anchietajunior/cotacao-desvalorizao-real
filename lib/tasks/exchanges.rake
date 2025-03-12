desc 'Imprime os registros de ExchangeRate ordenados por data (descendente)'
task exchanges: 'db:environment' do
  ExchangeRate.order(date: :desc).each do |record|
    puts "Data: #{record.date}, USD: #{record.usd}, EUR: #{record.eur}, BRL: #{record.brl}"
  end
end
