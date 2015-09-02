class AddSizeToMicroposts < ActiveRecord::Migration
  def change
    add_column :microposts, :size, :varchar
  end
end
