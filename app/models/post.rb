class Post < ApplicationRecord
  belongs_to :account
  has_rich_text :text
end
