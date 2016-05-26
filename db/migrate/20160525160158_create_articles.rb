class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title, null:false
      t.integer :category_id, null:false
      t.boolean :featured, default:false
      t.boolean :published, default:false

      t.timestamps null: false
    end
  end
end
