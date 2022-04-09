class AddStatusToMemos < ActiveRecord::Migration[6.0]
  def change
    add_column :memos, :status, :integer, null: false, default: 0
  end
end
