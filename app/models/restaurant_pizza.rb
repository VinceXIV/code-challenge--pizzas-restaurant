class RestaurantPizza < ApplicationRecord
  belongs_to :restaurant
  belongs_to :pizza
  validates :price, presence: :true, numericality: {greater_than: 1, less_than: 30}
end
