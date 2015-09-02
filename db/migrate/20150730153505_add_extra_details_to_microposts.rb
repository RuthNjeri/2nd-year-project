class AddExtraDetailsToMicroposts < ActiveRecord::Migration
  def change
    add_column :microposts, :extraDetails, :string
  end
end
