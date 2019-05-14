require "test_helper"
require "pry"

describe MoviesController do
  describe "index" do
    it "movies_path is a working end-point" do
      get movies_path

      must_respond_with :success
    end

    it "responds with json" do
      get movies_path

      expect(response.header["Content-Type"]).must_include "json"
    end

    it "returns an Array" do
      get movies_path

      body = JSON.parse(response.body)
      expect(body).must_be_kind_of Array
    end

    it "returns all movies " do
      get movies_path

      body = JSON.parse(response.body)

      expect(body.count).must_equal Movie.count
    end

    it "returns movies with exactly the required fields" do
      get movies_path

      keys = %w(id title overview release_date inventory)
      movie = movies(:movie_one)
      body = JSON.parse(response.body)

      body.each do |movie|
        movie.keys.must_equal keys
      end
    end
  end

  describe "create" do
    let(:movie_data) {
      {
        title: "Avengers: Endgame",
        overview: "Spoilers!",
        release_date: Date.parse("2019-04-26"),
        inventory: 7,
      }
    }

    it "creates a new movie given valid data" do
      expect {
        post movies_path, params: { movie: movie_data }
      }.must_change "Movie.count", 1

      body = JSON.parse(response.body)
      expect(body).must_be_kind_of Hash
      expect(body).must_include "id"

      movie = Movie.find(body["id"].to_i)

      expect(movie.title).must_equal movie_data[:title]
      expect(movie.available_inventory).must_equal movie_data[:inventory]
      must_respond_with :success
    end

    it "returns an error for invalid movie data" do
      movie_data["title"] = nil

      expect {
        post movies_path, params: { movie: movie_data }
      }.wont_change "Movie.count"

      body = JSON.parse(response.body)

      expect(body).must_be_kind_of Hash
      expect(body).must_include "errors"
      expect(body["errors"]).must_equal ["Movie could not be saved"]
      must_respond_with :bad_request
    end
  end
end
