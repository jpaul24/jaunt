class AddDetailsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :first_name, :string
    add_column :users, :second_name, :string
    add_column :users, :username, :string
    add_column :users, :nationality, :string
    add_column :users, :bio, :text
  end
end
