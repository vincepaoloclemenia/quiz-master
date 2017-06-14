class AddForeignKeyToAnswers < ActiveRecord::Migration[5.0]
  def change
    add_reference :answers, :quiz_id, index: true
  end
end
