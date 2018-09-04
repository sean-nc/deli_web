class Cheese < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged
  has_one_attached :image
  has_many :orders, class_name: "CheeseOrder"
  belongs_to :supplier
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :image, presence: true
  validates :region, presence: true
  validates :milk, presence: true
  validates :texture, presence: true
  validates :strength, presence: true
  validates :slug, uniqueness: true
  validates :supplier_id, presence: true
  validates :price, presence: true
  validates :cost, presence: true
  validates :in_stock, presence: true
  validates :stock_goal, presence: true
end
