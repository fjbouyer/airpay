class PaymentsController < ApplicationController

  def new
    # On recupère les infos sur la commande
    @user = current_user
    @reservation = Reservation.find(params[:reservation_id])
    @order = Order.where( user: @user,
                          reservation: @reservation,
                          status: "En attente").last
    @order_products = @order.order_products

    @price_per_person = @reservation.price_per_hour_incl_vat_cents * @reservation.number_of_hour
    @total_price = @order.total_price_incl_vat_cents
  end

  def create
    @reservation = Reservation.find(params[:reservation_id])
    @order = Order.where(status: 'En attente').where(user: current_user, reservation_id: params[:reservation_id]).last
    # stripe_customer_id = current_user.stripe_customer_id

    # unless stripe_customer_id
      customer = Stripe::Customer.create(
        source: params[:stripeToken],
        email:  params[:stripeEmail]
      )

      # stripe_customer_id = customer.id
      # current_user.update(stripe_customer_id: stripe_customer_id)
    # end

    charge = Stripe::Charge.create(
      customer:     customer,   # You should store this customer id and re-use it.
      amount:       @order.total_price_incl_vat_cents, # or amount_pennies
      description:  "Payment for teddy test",
      currency:     "Eur"# 'EUR'
    )

    @order.update(payment: charge.to_json, status: 'paid')
    redirect_to reservation_path(@reservation)

  rescue Stripe::CardError => e
    flash[:alert] = e.message
    redirect_to new_order_payment_path(@order)
  end

end
