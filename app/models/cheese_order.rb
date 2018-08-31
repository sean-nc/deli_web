class CheeseOrder < ApplicationRecord
  belongs_to :cheese
  validates :cheese_id, presence: true
  validates :current_units, presence: true
  validates :ordered_units, presence: true
end
