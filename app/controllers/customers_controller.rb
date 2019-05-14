class CustomersController < ApplicationController
  def index
    customers = Customer.all
    render json: customers.as_json(only: [:name, :address, :registered_at, :city, :state, :postal_code, :phone]),
           # render json: { ok: true, pet: pets.as_json(only: [:id, :name, :age, :human])},
           status: :ok
  end
end
