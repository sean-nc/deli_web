class Supplier < ApplicationRecord
  has_many :cheeses
  has_many :cheese_orders
  validates :company_name, presence: true
  validates :name, presence: true
end
