class CreateSources < ActiveRecord::Migration
  def change
    create_table :sources do |t|
      t.string :title, null:false
      t.string :author
      t.string :publication
      t.string :url
      t.integer :article_id, null:false

      t.timestamps null: false
    end
  end
end
