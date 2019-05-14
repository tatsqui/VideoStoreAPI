class CustomersController < ApplicationController
  def index
    customers = Customer.all
    render json: customers.as_json(only: [:id, :name, :registered_at, :postal_code, :phone, :movies_checked_out_count]),
           status: :ok
  end

  private

  def customer_params
    params.require(customer).permit(:name, :registered_at, :postal_code, :phone)
  end
end
