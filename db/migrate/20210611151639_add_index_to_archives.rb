class AddIndexToArchives < ActiveRecord::Migration[6.0]
  def change
    add_index :archives, :created_at
  end
end
