require "test_helper"

describe CustomersController do
  describe "index" do
    it "is a real working route" do
      get customers_path
      must_respond_with :success
    end

    it "returns json" do
      get customers_path
      expect(response.header["Content-Type"]).must_include "json"
    end

    it "returns an Array" do
      get customers_path

      body = JSON.parse(response.body)
      body.must_be_kind_of Array
    end

    it "returns all of the customers" do
      get customers_path

      body = JSON.parse(response.body)
      body.length.must_equal Customer.count
    end

    it "returns customers with exactly the required fields" do
      keys = %w(id name registered_at postal_code phone movies_checked_out_count)
      get customers_path
      body = JSON.parse(response.body)
      body.each do |customer|
        customer.keys.must_equal keys
      end
    end
  end
end
