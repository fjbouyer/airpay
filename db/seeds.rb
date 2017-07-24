# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

sports_category = %w(Football Voley-ball Tennis)
sports_category.each do |sport_category|
  SportCategory.create!(name: sport_category)
end

products_category = %w(Nourriture Boissons Locations Ventes)
products_category.each do |product_category|
  ProductCategory.create!(name: product_category)
end

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

reservation_1 = Reservation.create!(sport_category: 1,
                                    user: adrien,
                                    date: Date.new,
                                    time: Date.new,
                                    number_of_hours: 2,
                                    price_per_hour_excl_VAT: 20,
                                    VAT_rate: 0.2)

reservation_2 = Reservation.create!(sport_category: 2,
                                    user: vincent,
                                    date: Date.new,
                                    time: Date.new,
                                    number_of_hours: 2,
                                    price_per_hour_excl_VAT: 20,
                                    VAT_rate: 0.2)

message_1 = Message.create!(content: "Trop bien cette appli!",
                            user: adrien,
                            reservation: resa1)

message_2 = Message.create!(content: "Trop ouf cette appli!",
                            user: vincent,
                            reservation: resa2)

order_1 = Order.create!(user: adrien,
                        reservation: reservation_1,
                        status: "En attente")

order_2 = Order.create!(user: vincent,
                        reservation: reservation_2,
                        status: "Payé")

order_reservation_1 = OrderReservation.create!(reservation: reservation_1,
                                                order: order_1,
                                                quantity: 2,
                                                total_price_excl_VAT: 42,
                                                VAT_rate: 0.2)

order_reservation_2 = OrderReservation.create!(reservation: reservation_2,
                                                order: order_2,
                                                quantity: 4,
                                                total_price_excl_VAT: 42,
                                                VAT_rate: 0.2)

bzh_cola = Product.create!(name: "Breizh Cola",
                            product_category_id: 2,
                            price_excl_VAT: 2,
                            VAT_rate: 0.2)

bierre = Product.create!(name: "Bierre",
                            product_category_id: 2,
                            price_excl_VAT: 2,
                            VAT_rate: 0.2)

OrderProduct.create!(product: bzh_cola,
                      order: order_1,
                      quantity: 3,
                      product_price: 2,
                      total_price: 6,
                      VAT_rate: 0.2)

OrderProduct.create!(product: bierre,
                      order: order_1,
                      quantity: 3,
                      product_price: 2,
                      total_price: 6,
                      VAT_rate: 0.2)
