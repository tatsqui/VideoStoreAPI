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
  
      expect{
        post checkout_path, params: rental_data
      }.must_change "Rental.count", +1
      
      body = JSON.parse(response.body)

      must_respond_with :ok
      expect(response.header["Content-Type"]).must_include "json"
      expect(body.keys).must_equal %w(id movie_id customer_id due_date)
    end

    # it "when checked out changes available to false" do 

    # end

    it "when checked out decreases inventory by one" do
      movie = movies(:movie_one)
      before_inventory = movie.available_inventory

      post checkout_path, params: rental_data
      movie.reload

      current_inventory = movie.available_inventory
      expect(current_inventory).must_equal before_inventory - 1
    end

    # nominal failure cases
    it "will not checkout a movie when all are unavailable" do 
      cant_rent_data = { 
          movie_id: movies(:unavailable_movie).id, 
          customer_id: customers(:jose).id 
        }
      expect{
        post checkout_path, params: cant_rent_data
      }.wont_change "Rental.count"
      
      body = JSON.parse(response.body)
      expect(body).must_include "errors"
      expect(body["errors"]).must_include "Could not create rental request"
      
    end

    # edge failure
    it "will not check out a non existant (bogus) movie" do 
      rental_no_movie = { 
          movie_id: -1, 
          customer_id: customers(:jose).id 
        }

      expect{
        post checkout_path, params: rental_no_movie
      }.wont_change "Rental.count"

      body = JSON.parse(response.body)
      expect(body).must_include "errors"
      expect(body["errors"]).must_include "Could not create rental request"
      
    end

    it "will not check out a non existant (bogus) customer" do 
      rental_no_customer = { movie_id: movies(:unavailable_movie).id, 
          customer_id: -1
        }

        expect{
          post checkout_path, params: rental_no_customer
        }.wont_change "Rental.count"
    end

    # edge success
    it "will allow a movie to be checked out on the same day it is checked back in" do 
      skip # check out movie, check back in and then check out again. 
    end

  end
end
