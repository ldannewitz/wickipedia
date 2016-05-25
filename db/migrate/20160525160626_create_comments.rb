class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :commenter_id, null:false
      t.integer :article_id, null:false
      t.text :content, null:false

      t.timestamps null: false
    end
  end
end
