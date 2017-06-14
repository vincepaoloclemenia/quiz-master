class CreateAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :answers do |t|
      t.text :ans
      t.boolean :is_correct
      t.integer :quiz_id
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :answers, [:user_id, :created_at]
  end
end
