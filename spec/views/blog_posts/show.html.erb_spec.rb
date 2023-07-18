require 'rails_helper'

RSpec.describe "blog_posts/show", type: :view do
  before(:each) do
    assign(:blog_post, BlogPost.create!(
      title: "Title",
      content: "MyText",
      view_count: 2,
      status: 3
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
  end
end
