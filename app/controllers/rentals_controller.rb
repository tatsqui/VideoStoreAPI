class RentalsController < ApplicationController
  def checkin
    movie = Movie.find_by(id: params[:movie_id])

    if movie.nil?
      render json: { errors: ["The movie with id #{params[:id]} could not be found"] }, status: :not_found
    elsif movie.increase_available_inventory
      render json: movie.as_json(only: [:available_inventory]), status: :ok
    else
      render json: { errors: ["The movie with id #{params[:id]} already have full inventory"] }, status: :bad_request
    end
  end

  private

  def rental_params
    params.permit(:movie_id, :customer_id)
  end
end
