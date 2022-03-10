class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.references :account, null: false, foreign_key: true
      t.references :post, null: false, foreign_key: true
      t.bigint  :likeable_id
      t.string  :likeable_type
      t.timestamps
    end
  end
end
