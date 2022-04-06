class CreateMemos < ActiveRecord::Migration[6.0]
  def change
    create_table :memos do |t|
      t.string     :title, null: false
      t.text       :goal , null: false
      t.text       :action
      t.text       :note
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
