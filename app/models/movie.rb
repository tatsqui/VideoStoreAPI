class Movie < ApplicationRecord
  validates :title, :inventory, presence: true

  def increase_available_inventory
    original_amount = self.available_inventory

    if self.inventory > original_amount
      self.available_inventory += 1
      return self.save!
    end
  end
end
