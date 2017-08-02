class ReservationsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :find]
  before_action :find_reservation, only: [:show, :confirmed]

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
  end

  def confirmed
    case @sport_category.name
      when "Foot5"
        @picto = "foot-crop.png"
      when "Padel"
        @picto = "padel-crop.png"
      when "Squash"
        @picto = "squash-crop.png"
      when "Foot5"
        @picto = "foot-crop.png"
    end
  end

  private

  def find_reservation
    @reservation = Reservation.find(params[:id])
    @sport_category = SportCategory.find(@reservation.sport_category_id)
    @orders = @reservation.orders.where(status: "Payé")
  end

end

