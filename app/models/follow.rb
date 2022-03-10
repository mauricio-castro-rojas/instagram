class Follow < ApplicationRecord
  # The user giving the follow
  belongs_to :follower, foreign_key: :follower_id, class_name: "Account"

  # The user being followed
  belongs_to :followed_user, foreign_key: :followed_account_id, class_name: "Account"
end
