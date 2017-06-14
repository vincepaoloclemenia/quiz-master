class CreateRelationships < ActiveRecord::Migration[5.0]
  def change
    create_table :relationships do |t|
      t.integer :enroller_id
      t.integer :enrolled_id

      t.timestamps
    end
    add_index :relationships, :enroller_id
    add_index :relationships, :enrolled_id
    add_index :relationships, [:enroller_id, :enrolled_id], unique: true
  end
end
