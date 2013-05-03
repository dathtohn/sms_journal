class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.string :content
      t.integer :user_id
      t.integer :question_id

      t.timestamps
    end
    add_index :responses, [:user_id, :question_id]
  end
end
