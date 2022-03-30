class Post < ApplicationRecord
  belongs_to :account
  has_many :likes, as: :likeable
  has_many :comments
  has_one_attached :post_image do |attachable|
    attachable.variant :thumb, resize_to_limit: [100, 100]
  end
  has_rich_text :text
  validates :text, presence: true

  def show_red_heart(post, account)
    post = Post.find(post.id)
    account = Account.find(account.id)
    count = post.likes.where(account_id: account.id).count
    if count == 0
      "hidden"
    else
      ""
    end
  end

  def show_gray_heart(post, account)
    post = Post.find(post.id)
    account = Account.find(account.id)
    count = post.likes.where(account_id: account.id).count
    if count == 1
      "hidden"
    else
      ""
    end
  end
end
