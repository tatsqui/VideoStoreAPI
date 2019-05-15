require "test_helper"

describe RentalsController do
  describe "checkout" do 
    let(:rental_data) { 
        rental_data = { 
          movie_id: movies(:movie_one).id, 
          customer_id: customers(:jose).id 
        } 
      }

    it "when checked out it adds a rental record to the rental table" do 
      movie = movies(:movie_one)
      before_inventory = movie.available_inventory
      
      expect{
        post checkout_path, params: rental_data
      }.must_change "Rental.count", +1
      movie.reload

      current_inventory = movie.available_inventory
      body = JSON.parse(response.body)

      must_respond_with :ok
      expect(current_inventory).must_equal before_inventory - 1
      expect(body.keys).must_equal %w(id movie_id customer_id due_date)
    end

    it "when checked out changes available to false" do 

    end

    it "when checked out decreases inventory by one" do
      
    end

    # nominal failure cases
    it "will not checkout a movie when all are unavailable" do 

    end

    # edge failure
    it "will not check out a non existant (bogus) movie" do 

    end

    # edge success
    it "will allow a movie to be checked out on the same day it is checked back in" do 
      # check out movie, check back in and then check out again. 
    end

  end
end
