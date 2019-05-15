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
    it "can checkin a movie if inventory is greater than available inventory" do
    end

    it "will increase the available inventory when a movie is checked in" do
    end

    it "can't checkin a movie if inventory equals available inventory" do
    end

    it "can't checkin a non existent movie" do
    end

    # it "can only checkin a movie that specific customer checked out" do
    # end
  end
end
