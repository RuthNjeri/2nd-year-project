class AddTownToMicropost < ActiveRecord::Migration
  def change
    add_reference :microposts, :town, index: true
    add_foreign_key :microposts, :towns
  end
end
