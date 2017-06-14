class FixColumn < ActiveRecord::Migration[5.0]
  def self.up
    rename_column :users, :type, :user_type
  end
end
