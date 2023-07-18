class Admin::BlogPostsController < ApplicationController
  http_basic_authenticate_with name: ENV['ADMIN_USERNAME'], password: ENV['ADMIN_PASSWORD']
  def index
    @blog_posts = BlogPost.all
  end
end
