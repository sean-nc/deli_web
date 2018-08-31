class Supplier < ApplicationRecord
  has_many :cheeses
  validates :company_name, presence: true
  validates :name, presence: true

  def self.all_names
    self.all.map { |x| x.name }
  end
end
