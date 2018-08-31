class Supplier < ApplicationRecord
  has_many :cheeses
  validates :company_name, presence: true
  validates :name, presence: true
end
