class Post < ApplicationRecord
  belongs_to :account
  has_many :likes, as: :likeable
  has_one_attached :post_image
  has_rich_text :text
end
