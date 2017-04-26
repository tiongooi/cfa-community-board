class AddLocationToNotices < ActiveRecord::Migration[5.0]
  def change
    add_column :notices, :location, :string
  end
end
