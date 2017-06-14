class FixColumns < ActiveRecord::Migration[5.0]
  def change
    change_column :answers, :ans, :string
    change_column :quizzes, :answer, :string
  end
end
