require "test_helper"

describe RentalsController do
  describe "checkout" do
    # nominal success cases
    it "when checked out it adds a rental record to the rental table" do
      post checkout_path(movies(:movie_one))
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

  describe "checkin" do
    let(:customer1) { customers(:skyler) }
    let(:movie1) { movies(:movie_two) }
    let(:rental_data1) {
      {
        movie_id: movie1.id,
        customer_id: customer1.id,
      }
    }

    let(:customer2) { customers(:jose) }
    let(:movie2) { movies(:movie_one) }
    let(:rental_data2) {
      {
        movie_id: movie2.id,
        customer_id: customer2.id,
      }
    }

    let(:rental_data3) {
      {
        movie_id: "dog",
        customer_id: customer2.id,
      }
    }

    it "can checkin a movie if inventory is greater than available inventory" do
      post checkin_path, params: rental_data1

      must_respond_with :success
    end

    it "can't checkin a movie if inventory equals available inventory" do
      post checkin_path, params: rental_data2

      must_respond_with :bad_request
    end

    it "can't checkin a non existent movie" do
      post checkin_path, params: rental_data3

      must_respond_with :not_found
    end
  end
end
