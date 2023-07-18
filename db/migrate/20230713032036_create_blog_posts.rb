class CreateBlogPosts < ActiveRecord::Migration[7.0]
  def change
    create_table :blog_posts do |t|
      t.string :title
      t.text :content
      t.integer :view_count
      t.integer :status, default: 1

      t.timestamps
    end
  end
end
