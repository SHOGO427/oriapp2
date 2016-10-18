class AddSakeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :sake, :string
  end
end
