class RemoveQuizId < ActiveRecord::Migration[5.0]
  def change
    remove_column :answers, :quiz_id, :integer
    rename_column :answers, :quiz_id_id, :quiz_id
  end
end
