class Comment < ApplicationRecord
  belongs_to :account
  belongs_to :post
  has_many :likes, as: :likeable
  has_rich_text :text

  def show_red_heart(comment)
    comment = Comment.find(comment.id)
    account = Account.find(comment.account_id)
    count = comment.likes.where(account_id: account.id).count
    if count == 0
      "hidden"
    else
      ""
    end
  end

  def show_gray_heart(comment)
    comment = Comment.find(comment.id)
    account = Account.find(comment.account_id)
    count = comment.likes.where(account_id: account.id).count
    if count == 1
      "hidden"
    else
      ""
    end
  end
end
