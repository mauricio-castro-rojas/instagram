class RemoveLikeableFromComments < ActiveRecord::Migration[7.0]
  def change
    remove_column :comments, :likeable_id, :bigint
    remove_column :comments, :likeable_type, :string
  end
end
