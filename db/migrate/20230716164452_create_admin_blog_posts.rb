class CreateAdminBlogPosts < ActiveRecord::Migration[7.0]
  def change
    create_table :admin_blog_posts do |t|

      t.timestamps
    end
  end
end
