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
foot_category = SportCategory.create!(name: "Football")
tennis_category = SportCategory.create!(name: "Tennis")

puts "Start ProductCategory"
boisson_category = ProductCategory.create!(name: "Boissons")
loc_category = ProductCategory.create!(name: "Location")

puts "Start User"
adrien = User.create!(first_name: "Adrien",
              last_name: "Larere",
              postal_code: 44000,
              phone_number: "0987654321",
              email: "adrien.larere@gmail.com",
              password: "secret")

vincent = User.create!(first_name: "Vincent",
              last_name: "HR",
              postal_code: 44000,
              phone_number: "0987654321",
              email: "vince.hr@gmail.com",
              password: "secret")

puts "Start Reservation"
reservation_1 = Reservation.create!(sport_category: foot_category,
                                    user: adrien,
                                    date: Date.new,
                                    time: Date.new,
                                    number_of_hour: 2,
                                    price_per_hour_excl_vat: 20,
                                    vat_rate: 0.2)

reservation_2 = Reservation.create!(sport_category: foot_category,
                                    user: vincent,
                                    date: Date.new,
                                    time: Date.new,
                                    number_of_hour: 2,
                                    price_per_hour_excl_vat: 20,
                                    vat_rate: 0.2)

puts "Start Message"
message_1 = Message.create!(content: "Trop bien cette appli!",
                            user: adrien,
                            reservation: reservation_1)

message_2 = Message.create!(content: "Trop ouf cette appli!",
                            user: vincent,
                            reservation: reservation_2)

puts "Start Order"
order_1 = Order.create!(reservation: reservation_1,
                        user: adrien,
                        quantity: 2,
                        total_price_excl_vat: 42,
                        vat_rate: 0.2,
                        status: "En attente")

order_2 = Order.create!(reservation: reservation_2,
                        user: vincent,
                        quantity: 4,
                        total_price_excl_vat: 42,
                        vat_rate: 0.2,
                        status: "Payé")

puts "Start Product"
bzh_cola = Product.create!(name: "Breizh Cola",
                            product_category: boisson_category,
                            price_excl_vat: 2,
                            vat_rate: 0.2)

bierre = Product.create!(name: "Bierre",
                            product_category: boisson_category,
                            price_excl_vat: 2,
                            vat_rate: 0.2)

puts "Start OrderProduct"
OrderProduct.create!(product: bzh_cola,
                      order: order_1,
                      quantity: 3,
                      product_price: 2,
                      total_price: 6,
                      vat_rate: 0.2)

OrderProduct.create!(product: bierre,
                      order: order_1,
                      quantity: 3,
                      product_price: 2,
                      total_price: 6,
                      vat_rate: 0.2)

puts "Seeds has been planted =)"
