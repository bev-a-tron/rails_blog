class CreateArticlesTags < ActiveRecord::Migration
  def change
    create_table :articles_tags do |t|
      t.integer :article_id, :tag_id, null: false
    end
  end
end
