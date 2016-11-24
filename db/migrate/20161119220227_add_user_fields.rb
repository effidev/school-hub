class AddUserFields < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string, :limit => 42
    add_column :users, :last_name, :string, :limit => 42
  end
end
