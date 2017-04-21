class CreateIssues < ActiveRecord::Migration[5.0]
  def change
    create_table :issues do |t|
      t.references :user, foreign_key: true
      t.string :title
      t.text :content
      t.integer :receipt

      t.timestamps
    end
  end
end
