json.extract! blog_post, :id, :title, :content, :view_count, :status, :created_at, :updated_at
json.url blog_post_url(blog_post, format: :json)
