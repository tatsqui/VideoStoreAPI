require "test_helper"

describe Movie do
  let(:movie) { Movie.new }

  describe "validations and instantiation" do
    it "won't be valid without title and inventory" do
      expect(movie).wont_be :valid?

      # for title
      expect(movie.errors.messages).must_include :title
      expect(movie.errors.messages[:title]).must_equal ["can't be blank"]

      # for inventory
      expect(movie.errors.messages).must_include :inventory
      expect(movie.errors.messages[:inventory]).must_equal ["can't be blank"]
    end

    it "will be valid with title and inventory" do
      movie.update_attributes({ title: "Test movie", inventory: 5 })

      expect(movie).must_be :valid?
      expect(movie.errors.messages).must_be_empty
    end

    it "responds to its fields" do
      ["title", "overview", "release_date", "inventory"].each do |field|
        expect(movie).must_respond_to field
      end
    end
  end

  describe "relationships" do
    it "" do
    end
  end

  describe "custom methods" do
    let(:movie) { movies(:movie_two) }
    let(:movie1) { movies (:movie_one) }

    it "will increase the available inventory when a movie is checked in" do
      amount = movie.available_inventory
      movie.increase_available_inventory

      movie.reload

      new_amount = movie.available_inventory

      expect(new_amount).must_equal amount + 1
    end

    it "will not increase the available inventory when the movie is not currently checked out" do
      amount = movie1.available_inventory
      movie1.increase_available_inventory

      movie1.reload

      new_amount = movie1.available_inventory

      expect(new_amount).must_equal amount
    end
  end
end
