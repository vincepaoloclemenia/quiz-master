class RemoveTable < ActiveRecord::Migration[5.0]
  def change
    drop_table :quiz_histories
  end
end
