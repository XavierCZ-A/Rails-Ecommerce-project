class Product < ApplicationRecord
  include PgSearch::Model

  belongs_to  :category
  has_many_attached :images
  has_many :stocks, dependent: :destroy
  has_many :order_products, dependent: :destroy
  belongs_to :user

  enum status: [:pending_review, :published, :rejected, :approved]

  pg_search_scope :search_full_text, against: {
    title: 'A',
    description: 'B',
  }

  ORDER_BY = {
    newest: "created_at DESC",
    expensive: "price DESC",
    cheaper: "price ASC"
  }

  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true, :numericality => { greater_than_or_equal_to: 0 }
  validates :category_id, presence: true

end
