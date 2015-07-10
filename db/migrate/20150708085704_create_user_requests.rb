class CreateUserRequests < ActiveRecord::Migration
  def change
    create_table :user_requests do |t|
      t.references :user, index: true
      t.references :town, index: true

      t.timestamps null: false
    end
    add_foreign_key :user_requests, :users
    add_foreign_key :user_requests, :towns
  end
end
