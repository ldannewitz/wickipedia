class CreateEdits < ActiveRecord::Migration
  def change
    create_table :edits do |t|
      t.integer :article_id, null:false
      t.integer :editor_id, null:false
      t.text :content, null:false

      t.timestamps null: false
    end
  end
end
