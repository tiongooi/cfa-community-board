class UserMobilenumberChangeColumnType < ActiveRecord::Migration[5.0]
  def change
    change_column(:users, :mobilenumber, :string)
  end
end
