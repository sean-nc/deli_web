class Cheese < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged
  has_one_attached :image
  has_many :orders, class_name: "CheeseOrders"
  belongs_to :supplier
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :image, presence: true
  validates :region, presence: true
  validates :milk, presence: true
  validates :texture, presence: true
  validates :strength, presence: true
  validates :slug, uniqueness: true
  validates :supplier_id, presence: true
end
