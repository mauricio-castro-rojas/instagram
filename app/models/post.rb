class Post < ApplicationRecord
  belongs_to :account
  has_many :likes, as: :likeable
  has_one_attached :post_image do |attachable|
    attachable.variant :thumb, resize_to_limit: [100, 100]
  end
  has_rich_text :text
  validates :text, presence: true
end
