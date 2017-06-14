class CreateQuizzes < ActiveRecord::Migration[5.0]
  def change
    create_table :quizzes do |t|
      t.text :question
      t.text :answer
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :quizzes, [:user_id, :created_at] 
  end
end
