class Order < ApplicationRecord
  enum status: [:pending , :processed , :shipped , :delivered , :cancelled]
end
