class ReservationsController < ApplicationController

  def find
    @creator_id = User.where("LOWER(last_name) LIKE ?", "#{params[:reservation][:creator_last_name].downcase}")
    @sport_category = SportCategory.find(params[:reservation][:sport_category])
    @date = params[:reservation][:date]
    @reservations = Reservation.where(user_id: @creator_id, sport_category_id: @sport_category, date: @date)
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js  # <-- will render `app/views/reservations/find.js.erb`
    end
  end

  def show
    @reservation = Reservation.find(params[:id])
    @sport_category = SportCategory.find(@reservation.sport_category_id)
    @orders = @reservation.orders.where(status: "Payé")
  end

end

