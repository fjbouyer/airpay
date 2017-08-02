class OrdersController < ApplicationController

  def new
    # On recupère la reservation et on check son existence
    @reservation = Reservation.where(id: params[:reservation_id]).first
    unless @reservation.nil?

      # On recupere la liste de tous les produits ainsi que leur catégories
      @products = {}
      categories = ProductCategory.all
      categories.each do |category|
        @products[category] = Product.where(product_category_id: category.id)
      end

      # On créer un order en lien avec la réservation et notre current user
      @order = Order.new( status: "En attente",
                          reservation: @reservation,
                          user: current_user)

      # On prepare des champs pour la vue
      @reservation_item_title = " #{@order.reservation.sport_category.name} -
                                  #{@order.reservation.number_of_hour} heures -
                                  Pour <span class=\"reservation-person-number\">1</span> personne."
      @reservation_price_per_person = @order.reservation.number_of_hour * @order.reservation.price_per_hour_incl_vat
      @title = "Réservation #{@reservation.id} - #{@reservation.sport_category.name} le #{@reservation.time}"

    end
  end

  def create
    # On recupere les infos
    cart_infos = JSON.parse(params[:order][:cart_snapshot])
    params_reservation_id = params[:reservation_id]

    # On verifie la correspondence des id pour ne pas faire d'erreur
    if cart_infos["resa"]["reservation_id"] == params_reservation_id
      @reservation = Reservation.find(params[:reservation_id])
      @user = current_user

      # On definit quelques variables pour reverifier l'info fournit
      reservation_vat_rate = 0.2
      calculated_total_price_incl_vat_cents = 0
      price_of_reservation =  @reservation.number_of_hour *
                              @reservation.price_per_hour_incl_vat_cents *
                              cart_infos["resa"]["reservation_quantity"].to_i

      # On créer un nouvel ordre (mondial) avec les infos sur l'user, la résa, le panier
      @order = Order.new( status: "En vérification",
                          person_quantity: cart_infos["resa"]["reservation_quantity"],
                          total_price_incl_vat_cents: calculated_total_price_incl_vat_cents,
                          reservation_vat_rate: reservation_vat_rate,
                          cart_snapshot: params[:order][:cart_snapshot],
                          reservation:  @reservation,
                          user:         current_user,
                          postal_code:  @user.postal_code,
                          first_name:   @user.first_name,
                          last_name:    @user.last_name,
                          phone_number: @user.phone_number,
                          email:        @user.email)

      # Si les infos de l'order sont valides (sauf le prix), on enregistre et continue
      if @order.valid?
        @order.save

        # Si on a des items en plus de la résa, on creer les product order qui vont bien
        unless cart_infos["items"].empty?
          cart_infos["items"].each do |item|
            # On recupere le produit pour avoir ses infos, s'il existe etc...
            product = Product.where(id: item["product_id"]).first
            unless product.nil?
              new_order_product = OrderProduct.create!(order_id: @order.id,
                                                      product_id: item["product_id"],
                                                      quantity: item["product_quantity"],
                                                      product_price_incl_vat_cents: product.price_incl_vat_cents,
                                                      product_vat_rate: product.vat_rate)
              # On recalcule le prix total pour chaque item
              calculated_total_price_incl_vat_cents += product.price_incl_vat_cents * item["product_quantity"].to_i
            else
              puts "Produit non trouvé"
            end
          end
        end

        # On recalcule le prix total de la résa
        total_price = calculated_total_price_incl_vat_cents + price_of_reservation

        # Si ils correspondent, on met a jour l'order et on passe à la suite
        p total_price
        p cart_infos["total_price"]
        if (total_price/100) == cart_infos["total_price"]
          @order.update(status: "En attente", total_price_incl_vat_cents: total_price)
          redirect_to new_reservation_payment_path(@reservation)
        else
          # Le prix calculé ne coorepond pas au prix fournit
          puts "Erreur de prix, petit polisson"
        end
      else
        # Impossible de creer un order
        puts "Quelque chose ne va pas bien dans l'Order object"
      end
    else
      # Les id de résa ne sont pas les memes, wtf
      puts "Erreur, les id des reservations ne correspondent pas !"
      render :new
    end
  end
end
