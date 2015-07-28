class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.references :user, index: true,null: false
      t.references :micropost, index: true,null: false

      t.timestamps null: false
    end
    add_foreign_key :bookings, :users
    add_foreign_key :bookings, :microposts 
   
  end
end
