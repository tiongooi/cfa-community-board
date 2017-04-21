class AddColumnToNotice < ActiveRecord::Migration[5.0]
  def change
    add_column :notices, :classification, :string
    add_column :notices, :postcode, :integer
  end
end
