class AddTeacherId < ActiveRecord::Migration[5.0]
  def change
    add_column :answers, :teacher_id, :integer
  end
end
