class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.string :tag
      t.text :content
      t.references :user

      t.timestamps
    end
    add_index :articles, :user_id
    add_index :articles, :created_at
  end
end
