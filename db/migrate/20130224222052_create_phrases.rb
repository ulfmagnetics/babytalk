class CreatePhrases < ActiveRecord::Migration
  def change
    create_table :phrases do |t|
      t.text :content
      t.integer :user_id

      t.timestamps
    end
    add_index :phrases, [:user_id, :created_at]
  end
end
