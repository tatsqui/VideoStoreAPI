require "test_helper"

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

      keys = %w(title overview release_date inventory)
      movie = movies(:movie_one)
      body = JSON.parse(response.body)

      body.each do |movie|
        movie.keys.must_equal keys
      end
    end
  end

  describe "show" do 
    it "movie_path renders correctly" do 

    end
  end
end
