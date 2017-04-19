class AddFieldsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :firstname, :string
    add_column :users, :lastname, :string
    add_column :users, :mobilenumber, :integer
    add_column :users, :postcode, :integer
  end
end
