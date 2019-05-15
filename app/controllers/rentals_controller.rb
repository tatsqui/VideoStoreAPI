class RentalsController < ApplicationController
  
  def checkout
  #   rental = Rental.new(movie_id: params[:movie_id], customer_id: params[:customer_id])
  #   movie = Movie.find_by(id: params[:movie_id])

  #   rental.checkout_date = Date.today
  #   rental.due_date = rental.checkout_date + 7

  #   if rental.save
  #     movie.update_attributes({inventory: movie.inventory - 1})
  #     render json: movie.as_json(only: [:id]),
  #     status: :ok
  #   else 
  #     render json: {}
  #   end
  end
  
  private

  def rental_params
    params.permit(:movie_id, :customer_id)
  end
end
