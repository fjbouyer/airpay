class ReservationsController < ApplicationController

  def find
    @user_id = User.where("LOWER(last_name) LIKE ?", "#{params[:reservation][:creator_last_name].downcase}")
    @sport_category = SportCategory.find(params[:reservation][:sport_category])
    @date = params[:reservation][:date]
    @reservations = Reservation.where(user_id: @user_id, sport_category_id: @sport_category, date: @date)
  end


end
