class AddImageToIssues < ActiveRecord::Migration[5.0]
  def change
    add_column :issues, :image, :string
  end
end
