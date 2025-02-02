require 'net/http'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Account.create([
  {
    api_key: 'bramsdockercomposecirclejerk',
    name: 'Brams',
    balance: 100000
  }#, {}, ...
])

Stonk.create(
  name: "TheDonald A/S",
  price: 0
)

resp = Net::HTTP.get_response(URI.parse("https://raw.githubusercontent.com/aau-datsw/ruslan-workshop/master/data/market_norm.json"))
data = resp.body
result = JSON.parse(data)
stonk = Stonk.default_stonk
arr = []


result['data'].each do |data|
  arr << {
    price: data['y'],
    stonk_id: stonk.id,
    recorded: DateTime.new(2019,10,18,20).in_time_zone("Europe/Copenhagen") + data['x'].seconds
  }
end

StonkHistory.import(arr)
