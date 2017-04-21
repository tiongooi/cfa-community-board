class AddColumnToIssue < ActiveRecord::Migration[5.0]
  def change
    add_column :issues, :classification, :string
    add_column :issues, :postcode, :integer
  end
end
