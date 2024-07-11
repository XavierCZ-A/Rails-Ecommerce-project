class Product < ApplicationRecord
  belongs_to  :category
  has_many_attached :images
  has_many :stocks, dependent: :destroy

  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true, :numericality => { :only_integer => true }
  validates :category_id, presence: true

end
