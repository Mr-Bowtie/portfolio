class BlogPostsController < ApplicationController
  before_action :set_blog_post, only: %i[show edit update destroy]

  # GET /blog_posts or /blog_posts.json
  def index
    # only show published blog posts
    @blog_posts = BlogPost.all.where(status: 2)
  end

  # GET /blog_posts/1 or /blog_posts/1.json
  def show; end

end
