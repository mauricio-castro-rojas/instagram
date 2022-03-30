class Follow < ApplicationRecord

  belongs_to :follower, foreign_key: :follower_id, class_name: "Account"
  #follower : los seguidores de mauricio

  belongs_to :followed_account, foreign_key: :followed_account_id, class_name: "Account"
  #followed: Mauricio sigue a la cuenta (la cuenta seguida por mauricio)
end
