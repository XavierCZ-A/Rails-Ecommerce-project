class Stock < ApplicationRecord
  belongs_to :product

  validates :quantity, numericality: { greater_than: 0 }
end
