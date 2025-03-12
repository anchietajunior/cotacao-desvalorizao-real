class CreateExchangeRates < ActiveRecord::Migration[6.0]
  def change
    create_table :exchange_rates do |t|
      t.date    :date, null: false
      t.decimal :usd, precision: 10, scale: 4, null: false
      t.decimal :eur, precision: 10, scale: 4, null: false
      t.decimal :brl, precision: 10, scale: 4, null: false
      t.timestamps
    end

    add_index :exchange_rates, :date, unique: true
  end
end
