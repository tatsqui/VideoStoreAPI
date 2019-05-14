class MoviesController < ApplicationController

  def index
    movies = Movie.all
    render status: :ok, json: movies.as_json(only: [:title, :inventory, :overview, :release_date])
  end

  private
  
  def movie_params
    params.require(movie).permit(:title, :inventory, :overview, :release_date)
  end
end


