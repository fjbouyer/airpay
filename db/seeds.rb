# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# sports_category = %w(Football Voley-ball Tennis)
# sports_category.each do |sport_category|
#   SportCategory.create!(name: sport_category)
# end
#
# products_category = %w(Nourriture Boissons Locations Ventes)
# products_category.each do |product_category|
#   ProductCategory.create!(name: product_category)
# end
puts "Destroying db..."

OrderProduct.destroy_all
Product.destroy_all
Order.destroy_all
Message.destroy_all
Reservation.destroy_all
User.destroy_all
ProductCategory.destroy_all
SportCategory.destroy_all

puts "Start populating db with seeds"

puts "Start SportCategory"
foot_category = SportCategory.create!(name: "Foot5")
padel_category = SportCategory.create!(name: "Padel")
squash_category = SportCategory.create!(name: "Squash")
bad_category = SportCategory.create!(name: "Badminton")

puts "Start ProductCategory"
boisson_category = ProductCategory.create!(name: "Boissons")
loc_category = ProductCategory.create!(name: "Location de matériel")
vente_category = ProductCategory.create!(name: "Vente de matériel")
food_category = ProductCategory.create!(name: "Petite faim")

puts "Start User"

julien = User.create!(first_name: "Julien",
              last_name: "VDS",
              postal_code: 44000,
              phone_number: "0987654321",
              email: "julien@gmail.com",
              password: "secret")

jo = User.create!(first_name: "Jo",
              last_name: "Bouyer",
              postal_code: 44000,
              phone_number: "0987654321",
              email: "jo@gmail.com",
              password: "secret")

john = User.create!(first_name: "John",
              last_name: "Lennon",
              postal_code: 44000,
              phone_number: "0987654321",
              email: "john@gmail.com",
              password: "secret")

michael = User.create!(first_name: "Michael",
              last_name: "Jackson",
              postal_code: 44000,
              phone_number: "0987654321",
              email: "michael@gmail.com",
              password: "secret")

puts "Start Reservation"
reservation_1 = Reservation.create!(sport_category: foot_category,
                                    creator: jo,
                                    date: Date.new(2017,7,28),
                                    time: DateTime.new(2017,7,28, 19, 00),
                                    number_of_hour: 2,
                                    price_per_hour_excl_vat: 20,
                                    vat_rate: 0.2)

reservation_2 = Reservation.create!(sport_category: padel_category,
                                    creator: julien,
                                    date: Date.new(2017,7,28),
                                    time: DateTime.new(2017,7,28, 18, 00),
                                    number_of_hour: 2,
                                    price_per_hour_excl_vat: 20,
                                    vat_rate: 0.2)

reservation_3 = Reservation.create!(sport_category: foot_category,
                                    creator: jo,
                                    date: Date.new(2017,7,28),
                                    time: DateTime.new(2017,7,28, 17, 00),
                                    number_of_hour: 2,
                                    price_per_hour_excl_vat: 20,
                                    vat_rate: 0.2)

reservation_4 = Reservation.create!(sport_category: bad_category,
                                    creator: michael,
                                    date: Date.new(2017,7,28),
                                    time: DateTime.new(2017,7,28, 20, 30),
                                    number_of_hour: 2,
                                    price_per_hour_excl_vat: 20,
                                    vat_rate: 0.2)

reservation_5 = Reservation.create!(sport_category: foot_category,
                                    creator: jo,
                                    date: Date.new(2017,5,4),
                                    time: DateTime.new(2017,5,4, 19, 30),
                                    number_of_hour: 2,
                                    price_per_hour_excl_vat: 20,
                                    vat_rate: 0.2)

reservation_6 = Reservation.create!(sport_category: padel_category,
                                    creator: julien,
                                    date: Date.new(2017,5,4),
                                    time: DateTime.new(2017,5,4, 20, 00),
                                    number_of_hour: 2,
                                    price_per_hour_excl_vat: 20,
                                    vat_rate: 0.2)

reservation_7 = Reservation.create!(sport_category: foot_category,
                                    creator: julien,
                                    date: Date.new(2017,5,4),
                                    time: DateTime.new(2017,5,4, 20, 30),
                                    number_of_hour: 2,
                                    price_per_hour_excl_vat: 20,
                                    vat_rate: 0.2)

reservation_8 = Reservation.create!(sport_category: bad_category,
                                    creator: jo,
                                    date: Date.new(2017,5,4),
                                    time: DateTime.new(2017,5,4, 21, 00),
                                    number_of_hour: 2,
                                    price_per_hour_excl_vat: 20,
                                    vat_rate: 0.2)

puts "Start Message"
message_1 = Message.create!(content: "C'est payé ! Quelqu'un peut m'emmener ?",
                            user: jo,
                            reservation: reservation_1)

message_2 = Message.create!(content: "Soyez bien à l'heure les gars ;)",
                            user: julien,
                            reservation: reservation_2)

puts "Start Order"
order_1 = Order.create!(reservation: reservation_1,
                        user: jo,
                        quantity: 1,
                        total_price_excl_vat: 42,
                        vat_rate: 0.2,
                        status: "En attente")

order_2 = Order.create!(reservation: reservation_2,
                        user: julien,
                        quantity: 2,
                        total_price_excl_vat: 42,
                        vat_rate: 0.2,
                        status: "Payé")

puts "Start Product"
powerade = Product.create!(name: "Powerade",
                            product_category: boisson_category,
                            price_excl_vat: 2,
                            vat_rate: 0.2)

biere = Product.create!(name: "Bière",
                            product_category: boisson_category,
                            price_excl_vat: 2,
                            vat_rate: 0.2)

puts "Start OrderProduct"
OrderProduct.create!(product: powerade,
                      order: order_1,
                      quantity: 3,
                      product_price: 2,
                      total_price: 6,
                      vat_rate: 0.2)

OrderProduct.create!(product: biere,
                      order: order_1,
                      quantity: 3,
                      product_price: 2,
                      total_price: 6,
                      vat_rate: 0.2)

puts "Seeds has been planted =)"
