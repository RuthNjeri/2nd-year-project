class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.references :micropost, index: true
      t.references :user, index: true
      t.boolean :seen   , default:false

      t.timestamps null: false
    end
    add_foreign_key :notifications, :microposts
    add_foreign_key :notifications, :users
  end
end
