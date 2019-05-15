class RentalsController < ApplicationController
  
  
  private

  def rental_params
    params.permit(:movie_id:, :customer_id)
  end
end
