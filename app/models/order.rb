class Order < ApplicationRecord
  enum status: [:pending , :processed , :shipped , :delivered , :cancelled]
  has_many :order_products, dependent: :destroy
end
