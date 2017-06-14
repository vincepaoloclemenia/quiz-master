class RemoveColumns < ActiveRecord::Migration[5.0]
  def change
    remove_column :answers, :taken_at, :datetime
    remove_column :answers, :score, :integer
    remove_column :quizzes, :taken_at, :datetime
  end
end
