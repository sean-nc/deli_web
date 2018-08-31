class Region < ApplicationRecord
  validates :name, presence: true, uniqueness: { case_sensitive: false }

  def self.all_names
    self.all.map { |x| x.name }
  end
end
