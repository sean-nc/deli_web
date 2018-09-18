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

  def arrived
    self.received = true
    self.cheese.in_stock = (self.cases_ordered * self.units_per_case) + self.cheese.in_stock
    self.cheese.save 
    self.save
  end
end
