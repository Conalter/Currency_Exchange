require_relative('../models/exchange')

exchange.delete_all()

currency1 = exchange.new({
  "country_name" => "USA",
  "currency" => "Dollar",
  "rate" => "1.30"
})

currency2 = exchange.new({
  "country_name" => "EU",
  "currency" => "Euro",
  "rate" => "1.60"
})

currency1.save
currency2.save
