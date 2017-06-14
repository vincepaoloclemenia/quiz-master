class AddDateToAnswers < ActiveRecord::Migration[5.0]
  def change
    add_column :answers, :taken_at, :datetime
  end
end
