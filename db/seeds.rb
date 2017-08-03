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
foot_category = SportCategory.create!(name: "Foot5", minimum_players: 10)
padel_category = SportCategory.create!(name: "Padel", minimum_players: 4)
squash_category = SportCategory.create!(name: "Squash", minimum_players: 2)
bad_category = SportCategory.create!(name: "Badminton", minimum_players: 2)

puts "Start ProductCategory"
boisson_category = ProductCategory.create!(name: "Boissons")
loc_category = ProductCategory.create!(name: "Loc. de matériel")
vente_category = ProductCategory.create!(name: "Vente de matériel")
food_category = ProductCategory.create!(name: "Petite faim")

puts "Start User"

julien = User.create!(first_name: "Julien",
              last_name: "Vanderstock",
              postal_code: 44000,
              phone_number: "0987654321",
              email: "julien@gmail.com",
              photo_url: "avatar1.jpg",
              password: "secret")

jo = User.create!(first_name: "François-Joseph",
              last_name: "Bouyer",
              postal_code: 44000,
              phone_number: "0987654321",
              email: "jo@gmail.com",
              photo_url: "avatar2.jpg",
              password: "secret")

john = User.create!(first_name: "John",
              last_name: "Lennon",
              postal_code: 44000,
              phone_number: "0987654321",
              email: "john@gmail.com",
              photo_url: "avatar3.jpg",
              password: "secret")

pierre = User.create!(first_name: "Pierre",
              last_name: "Maison",
              postal_code: 44000,
              phone_number: "0987654321",
              email: "pierre@gmail.com",
              photo_url: "avatar4.jpg",
              password: "secret")
paul = User.create!(first_name: "Paul",
              last_name: "Cartonier",
              postal_code: 44000,
              phone_number: "0987654321",
              email: "paul@gmail.com",
              photo_url: "avatar5.jpg",
              password: "secret")
jean = User.create!(first_name: "Jean",
              last_name: "Janet",
              postal_code: 44000,
              phone_number: "0987654321",
              email: "jean@gmail.com",
              photo_url: "avatar6.jpg",
              password: "secret")

guillaume = User.create!(first_name: "Guillaume",
              last_name: "Lefou",
              postal_code: 44000,
              phone_number: "0987654321",
              email: "guillaume@gmail.com",
              photo_url: "avatar7.jpg",
              password: "secret")
matthieu = User.create!(first_name: "Mathieu",
              last_name: "Bernard",
              postal_code: 44000,
              phone_number: "0987654321",
              email: "matthieu@gmail.com",
              photo_url: "avatar8.jpg",
              password: "secret")
cedric = User.create!(first_name: "Cédric",
              last_name: "Lefou",
              postal_code: 44000,
              phone_number: "0987654321",
              email: "cedric@gmail.com",
              photo_url: "avatar9.jpg",
              password: "secret")
augustin = User.create!(first_name: "Augustin",
              last_name: "Michel",
              postal_code: 44000,
              phone_number: "0987654321",
              email: "augustin@gmail.com",
              photo_url: "avatar10.jpg",
              password: "secret")
raphael = User.create!(first_name: "Raphaël",
              last_name: "Lefou",
              postal_code: 44000,
              phone_number: "0987654321",
              email: "raphael@gmail.com",
              photo_url: "avatar11.jpg",
              password: "secret")
thibault = User.create!(first_name: "Thibault",
              last_name: "Lefou",
              postal_code: 44000,
              phone_number: "0987654321",
              email: "thibault@gmail.com",
              photo_url: "avatar12.jpg",
              password: "secret")
loic = User.create!(first_name: "Loïc",
              last_name: "Lefou",
              postal_code: 44000,
              phone_number: "0987654321",
              email: "loic@gmail.com",
              photo_url: "avatar13.jpg",
              password: "secret")
yann = User.create!(first_name: "yann",
              last_name: "Lefou",
              postal_code: 44000,
              phone_number: "0987654321",
              email: "yann@gmail.com",
              photo_url: "avatar14.jpg",
              password: "secret")
baptiste = User.create!(first_name: "Baptiste",
              last_name: "Lefou",
              postal_code: 44000,
              phone_number: "0987654321",
              email: "baptiste@gmail.com",
              photo_url: "avatar15.jpg",
              password: "secret")



puts "Start Reservation"
reservation_1 = Reservation.create!(sport_category: foot_category,
                                    creator: jo,
                                    date: Date.new(2017,8,4),
                                    time: DateTime.new(2017,8,4, 13, 30),
                                    number_of_hour: 2,
                                    price_per_hour_incl_vat_cents: 800,
                                    vat_rate: 0.2)

reservation_2 = Reservation.create!(sport_category: foot_category,
                                    creator: julien,
                                    date: Date.new(2017,8,4),
                                    time: DateTime.new(2017,8,4, 18, 00),
                                    number_of_hour: 2,
                                    price_per_hour_incl_vat_cents: 800,
                                    vat_rate: 0.2)

reservation_3 = Reservation.create!(sport_category: foot_category,
                                    creator: jo,
                                    date: Date.new(2017,8,5),
                                    time: DateTime.new(2017,8,4, 17, 00),
                                    number_of_hour: 2,
                                    price_per_hour_incl_vat_cents: 800,
                                    vat_rate: 0.2)

reservation_4 = Reservation.create!(sport_category: bad_category,
                                    creator: julien,
                                    date: Date.new(2017,8,4),
                                    time: DateTime.new(2017,8,4, 20, 30),
                                    number_of_hour: 2,
                                    price_per_hour_incl_vat_cents: 800,
                                    vat_rate: 0.2)

reservation_5 = Reservation.create!(sport_category: squash_category,
                                    creator: jo,
                                    date: Date.new(2017,8,4),
                                    time: DateTime.new(2017,8,4, 19, 30),
                                    number_of_hour: 2,
                                    price_per_hour_incl_vat_cents: 800,
                                    vat_rate: 0.2)

reservation_6 = Reservation.create!(sport_category: padel_category,
                                    creator: julien,
                                    date: Date.new(2017,8,4),
                                    time: DateTime.new(2017,8,4, 20, 00),
                                    number_of_hour: 2,
                                    price_per_hour_incl_vat_cents: 800,
                                    vat_rate: 0.2)

reservation_7 = Reservation.create!(sport_category: squash_category,
                                    creator: julien,
                                    date: Date.new(2017,8,4),
                                    time: DateTime.new(2017,8,4, 20, 30),
                                    number_of_hour: 2,
                                    price_per_hour_incl_vat_cents: 800,
                                    vat_rate: 0.2)

reservation_8 = Reservation.create!(sport_category: bad_category,
                                    creator: jo,
                                    date: Date.new(2017,8,4),
                                    time: DateTime.new(2017,8,4, 21, 00),
                                    number_of_hour: 2,
                                    price_per_hour_incl_vat_cents: 800,
                                    vat_rate: 0.2)
reservation_9 = Reservation.create!(sport_category: padel_category,
                                    creator: jo,
                                    date: Date.new(2017,8,4),
                                    time: DateTime.new(2017,8,4, 15, 00),
                                    number_of_hour: 2,
                                    price_per_hour_incl_vat_cents: 800,
                                    vat_rate: 0.2)

puts "Start Order"
order_1 = Order.create!(reservation: reservation_1,
                        user: augustin,
                        person_quantity: 1,
                        total_price_incl_vat_cents: 1000,
                        reservation_vat_rate: 0.2,
                        status: "Payé",
                        postal_code: "12345",
                        first_name: "toto",
                        last_name: "tata",
                        phone_number: "0987654321",
                        email: "thisis@a.test")
order_2 = Order.create!(reservation: reservation_1,
                        user: julien,
                        person_quantity: 1,
                        total_price_incl_vat_cents: 1000,
                        reservation_vat_rate: 0.2,
                        status: "Payé",
                        postal_code: "12345",
                        first_name: "toto",
                        last_name: "tata",
                        phone_number: "0987654321",
                        email: "thisis@a.test")
order_3 = Order.create!(reservation: reservation_1,
                        user: john,
                        person_quantity: 1,
                        total_price_incl_vat_cents: 1000,
                        reservation_vat_rate: 0.2,
                        status: "Payé",
                        postal_code: "12345",
                        first_name: "toto",
                        last_name: "tata",
                        phone_number: "0987654321",
                        email: "thisis@a.test")
order_4 = Order.create!(reservation: reservation_1,
                        user: pierre,
                        person_quantity: 1,
                        total_price_incl_vat_cents: 1000,
                        reservation_vat_rate: 0.2,
                        status: "Payé",
                        postal_code: "12345",
                        first_name: "toto",
                        last_name: "tata",
                        phone_number: "0987654321",
                        email: "thisis@a.test")
order_5 = Order.create!(reservation: reservation_1,
                        user: paul,
                        person_quantity: 1,
                        total_price_incl_vat_cents: 1000,
                        reservation_vat_rate: 0.2,
                        status: "Payé",
                        postal_code: "12345",
                        first_name: "toto",
                        last_name: "tata",
                        phone_number: "0987654321",
                        email: "thisis@a.test")
order_6 = Order.create!(reservation: reservation_1,
                        user: jean,
                        person_quantity: 1,
                        total_price_incl_vat_cents: 1000,
                        reservation_vat_rate: 0.2,
                        status: "Payé",
                        postal_code: "12345",
                        first_name: "toto",
                        last_name: "tata",
                        phone_number: "0987654321",
                        email: "thisis@a.test")
order_7 = Order.create!(reservation: reservation_1,
                        user: loic,
                        person_quantity: 1,
                        total_price_incl_vat_cents: 1000,
                        reservation_vat_rate: 0.2,
                        status: "Payé",
                        postal_code: "12345",
                        first_name: "toto",
                        last_name: "tata",
                        phone_number: "0987654321",
                        email: "thisis@a.test")
order_8 = Order.create!(reservation: reservation_1,
                        user: baptiste,
                        person_quantity: 1,
                        total_price_incl_vat_cents: 1000,
                        reservation_vat_rate: 0.2,
                        status: "Payé",
                        postal_code: "12345",
                        first_name: "toto",
                        last_name: "tata",
                        phone_number: "0987654321",
                        email: "thisis@a.test")
order_1 = Order.create!(reservation: reservation_2,
                        user: augustin,
                        person_quantity: 1,
                        total_price_incl_vat_cents: 1000,
                        reservation_vat_rate: 0.2,
                        status: "Payé",
                        postal_code: "12345",
                        first_name: "toto",
                        last_name: "tata",
                        phone_number: "0987654321",
                        email: "thisis@a.test")
order_2 = Order.create!(reservation: reservation_2,
                        user: julien,
                        person_quantity: 1,
                        total_price_incl_vat_cents: 1000,
                        reservation_vat_rate: 0.2,
                        status: "Payé",
                        postal_code: "12345",
                        first_name: "toto",
                        last_name: "tata",
                        phone_number: "0987654321",
                        email: "thisis@a.test")
order_3 = Order.create!(reservation: reservation_2,
                        user: john,
                        person_quantity: 1,
                        total_price_incl_vat_cents: 1000,
                        reservation_vat_rate: 0.2,
                        status: "Payé",
                        postal_code: "12345",
                        first_name: "toto",
                        last_name: "tata",
                        phone_number: "0987654321",
                        email: "thisis@a.test")
order_4 = Order.create!(reservation: reservation_2,
                        user: pierre,
                        person_quantity: 1,
                        total_price_incl_vat_cents: 1000,
                        reservation_vat_rate: 0.2,
                        status: "Payé",
                        postal_code: "12345",
                        first_name: "toto",
                        last_name: "tata",
                        phone_number: "0987654321",
                        email: "thisis@a.test")
order_5 = Order.create!(reservation: reservation_2,
                        user: paul,
                        person_quantity: 1,
                        total_price_incl_vat_cents: 1000,
                        reservation_vat_rate: 0.2,
                        status: "Payé",
                        postal_code: "12345",
                        first_name: "toto",
                        last_name: "tata",
                        phone_number: "0987654321",
                        email: "thisis@a.test")
order_6 = Order.create!(reservation: reservation_2,
                        user: jean,
                        person_quantity: 1,
                        total_price_incl_vat_cents: 1000,
                        reservation_vat_rate: 0.2,
                        status: "Payé",
                        postal_code: "12345",
                        first_name: "toto",
                        last_name: "tata",
                        phone_number: "0987654321",
                        email: "thisis@a.test")

puts "Start Product"
powerade = Product.create!(name: "Coca Cola 33cl",
                            product_category: boisson_category,
                            price_incl_vat_cents: 200,
                            vat_rate: 0.2,
                            picture_path: "products/coca-cola_33cl.jpg")

biere = Product.create!(name: "Bière",
                            product_category: boisson_category,
                            price_incl_vat_cents: 200,
                            vat_rate: 0.2,
                            picture_path: "products/amsterdam_maximator.jpg")

puts "Start OrderProduct"
OrderProduct.create!(product: powerade,
                      order: order_1,
                      quantity: 3,
                      product_price_incl_vat_cents: 200,
                      product_vat_rate: 0.2)

OrderProduct.create!(product: biere,
                      order: order_1,
                      quantity: 3,
                      product_price_incl_vat_cents: 200,
                      product_vat_rate: 0.2)

puts "Seeds has been planted =)"
