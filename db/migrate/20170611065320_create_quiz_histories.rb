class CreateQuizHistories < ActiveRecord::Migration[5.0]
  def change
    create_table :quiz_histories do |t|
      t.integer :score
      t.datetime :taken_at
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
