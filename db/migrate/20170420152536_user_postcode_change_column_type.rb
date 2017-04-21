class UserPostcodeChangeColumnType < ActiveRecord::Migration[5.0]
    def change
      change_column(:users, :postcode, :string)
      change_column(:notices, :postcode, :string)
      change_column(:issues, :postcode, :string)
    end

end
