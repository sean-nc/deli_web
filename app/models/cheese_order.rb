class CheeseOrder < ApplicationRecord
  belongs_to :cheese
  belongs_to :supplier
  validates :cheese_id, presence: true
  validates :supplier_id, presence: true
  validates :current_units, presence: true
  validates :cases_ordered, presence: true
  validates :case_price, presence: true
  validates :units_per_case, presence: true
  validates :description, length: { maximum: 200 }
end
