class MoviesController < ApplicationController

  def index
    movies = Movie.all
    render json: movies.as_json(only: [:available_inventory :id, :title, :inventory, :overview, :release_date]), status: :ok
  end
  
  # def show

  # end

  private

  def movie_params
    params.require(movie).permit(:title, :inventory, :overview, :release_date)
  end
end


