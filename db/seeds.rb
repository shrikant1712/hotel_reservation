# Pre Populate hotels into database
Hotel.create([
  { name: 'D Place', email: 'd_palace@test.com', phone: '0000000000' },
  { name: 'BlueWater', email: 'blue_water@test.com', phone: '1111111111' },
  { name: 'Absolute Barbecues', email: 'abs@test.com', phone: '2222222222' },
  { name: 'Le Flamington', email: 'las@test.com', phone: '3333333333' },
  { name: 'Royal China', email: 'royal_china@test.com', phone: '4444444444' },
  { name: 'The French Window Patisserie', email: 'french_window@test.com', phone: '5555555555' },
  { name: 'The Sassy Spoon', email: 'sasy_spoon@test.com', phone: '6666666666' },
  { name: 'Cafe 1730', email: 'cafe_1730@test.com', phone: '7777777777' },
  { name: 'Vohuman Cafe', email: 'vohuman_cafe@test.com', phone: '8888888888' },
  { name: 'Royal Palcae', email: 'royal_place@test.com', phone: '9999999999' }
])

# Pre Populate tables into database
# NOTE: Here we are assuming every hotel has 4 seater tables(i.e Max 4 people can seat on the table)
Hotel.all.each do |h|
  (1..10).to_a.each do |i|
    h.hotel_tables.create(name: i, min_seats: 1, max_seats: 4)
  end
end
