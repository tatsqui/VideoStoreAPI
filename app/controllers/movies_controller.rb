class MoviesController < ApplicationController
  def index
    movies = Movie.all
    render status: :ok, json: movies.as_json(only: [:id, :title, :inventory, :overview, :release_date])
  end

  def create
    movie = Movie.new(movie_params)
    movie.available_inventory = movie.inventory

    if movie.save
      render json: movie.as_json(only: [:id]),
             status: :ok
    else
      render json: { ok: false, errors: ["Movie could not be saved"] },
             status: :bad_request
    end
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :inventory, :overview, :release_date)
  end
end
