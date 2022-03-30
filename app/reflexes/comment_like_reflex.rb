class CommentLikeReflex < ApplicationReflex
  def like
    comment = Comment.find(element.dataset[:comment_id])
    account = Account.find(element.dataset[:account_id])
    count = comment.likes.where(account_id: account.id).count

    if count == 0
      Like.create!(account_id: account.id, likeable: comment)
    else
      remove_like = Like.where(account_id: account.id, likeable: comment)
      Like.delete(remove_like)
    end
  end
end