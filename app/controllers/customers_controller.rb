class CustomersController < ApplicationController
  def index
    customers = Customer.all
    render json: customers.as_json(only: [:name, :address, :registered_at, :city, :state, :postal_code, :phone]),
           status: :ok
  end

  private

  def customer_params
    params.require(customer).permit(:name, :address, :registered_at, :city, :state, :postal_code, :phone)
  end
end
