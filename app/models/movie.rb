class Movie < ApplicationRecord
  validates :title, :inventory, presence: true
end
