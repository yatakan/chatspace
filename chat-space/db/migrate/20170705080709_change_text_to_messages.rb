class ChangeTextToMessages < ActiveRecord::Migration[5.0]
  def up
    change_column :messages, :text, :text, null: true
  end

  def down
    change_column :messages, :text, :text, null: false
  end
end
