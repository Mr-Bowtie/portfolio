class BlogPost < ApplicationRecord
  has_rich_text :content
  enum status: { draft: 1, published: 2 }
end
