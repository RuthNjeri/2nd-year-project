class CreateMicroposts < ActiveRecord::Migration
  def change
    create_table :microposts do |t|
      t.string :region
      t.string :price
      t.text :details
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :microposts, :users
     add_index :microposts, [:user_id, :created_at]
  end
end
