class IssueReceiptChangeColumnType < ActiveRecord::Migration[5.0]
  def change
    change_column(:issues, :receipt, :string)
  end
end
