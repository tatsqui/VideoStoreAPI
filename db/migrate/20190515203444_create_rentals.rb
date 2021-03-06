class CreateRentals < ActiveRecord::Migration[5.2]
  def change
    create_table :rentals do |t|
      t.references :movie, foreign_key: true
      t.references :customer, foreign_key: true
      t.date :checkout_date
      t.date :due_date
      t.boolean :available, default: false

      t.timestamps
    end
  end
end
