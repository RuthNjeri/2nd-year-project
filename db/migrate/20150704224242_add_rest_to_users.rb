class AddRestToUsers < ActiveRecord::Migration
  def change
    add_column :users, :rest_digest, :string
    add_column :users, :rest_sent_at, :datetime
  end
end
