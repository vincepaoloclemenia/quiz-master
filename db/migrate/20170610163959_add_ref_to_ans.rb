class AddRefToAns < ActiveRecord::Migration[5.0]
  def change
    add_reference :answers, :quiz, foreign_key: true
  end
end
