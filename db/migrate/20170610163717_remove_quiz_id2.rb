class RemoveQuizId2 < ActiveRecord::Migration[5.0]
  def change
    remove_column :answers, :quiz_id, :integer
  end
end
