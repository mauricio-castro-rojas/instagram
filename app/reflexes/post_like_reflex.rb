# frozen_string_literal: true

class PostLikeReflex < ApplicationReflex
  def like
    post = Post.find(element.dataset[:post_id])
    account = Account.find(element.dataset[:account_id])
    count = post.likes.where(account_id: account.id).count

    if count == 0
      Like.create!(account_id: account.id, likeable: post)
    else
      remove_like = Like.where(account_id: account.id, likeable: post)
      Like.delete(remove_like)
    end
  end
end
