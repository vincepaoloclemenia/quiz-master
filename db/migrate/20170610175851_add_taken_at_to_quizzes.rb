class AddTakenAtToQuizzes < ActiveRecord::Migration[5.0]
  def change
    add_column :quizzes, :taken_at, :datetime
  end
end
