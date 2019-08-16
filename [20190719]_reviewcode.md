# 1. TopController
```
class TopController < ApplicationController
  def index
    @bl_im1 = Blog.all.order(impressions_count: :DESC).first
    @bl_im2 = Blog.all.order(impressions_count: :DESC).second
    @bl_im3 = Blog.all.order(impressions_count: :DESC).third
  end
end
```
Define scope in model/blog.rb
`scope :popular, -> { order(impressions_count: :DESC).take(3) }`
controller/top_controller.rb
`@popular_blogs = Blog.popular`
top/index.html
```
@popular_blogs.each do |blog|
end
```

# 2. blog_controller.rb
change: 
```
@bl_im1 = Blog.all.order(impressions_count: :DESC).first
@bl_im2 = Blog.all.order(impressions_count: :DESC).second
@bl_im3 = Blog.all.order(impressions_count: :DESC).third
```
like 1.


```
    @search = Blog.ransack(params[:q])
    @categories = Category.all
    @locations = Location.all
    @hashtags = Hashtag.all
    @search.sorts = 'blog_details.title desc' if @search.sorts.empty?
    @blogs = @search.result(distinct: true).order(created_at: :DESC).page(params[:page]).per(3)

    @blog_count = Blog.count
    @page = params[:page].to_i
    @last_page = @blogs.total_pages
```
gem ransack => view instruction.

`@blog_count = Blog.count` needed??? (read gem ransack)
`@last_page = @blogs.total_pages` needed to define variable ??? (move to view and call `@blogs.total_pages`

# 3. Why don't you use reuseable code?
example:
TopController => index
blog_controller => index + show
are having 
```
@bl_im1 = Blog.all.order(impressions_count: :DESC).first
@bl_im2 = Blog.all.order(impressions_count: :DESC).second
@bl_im3 = Blog.all.order(impressions_count: :DESC).third
```

# 4. Separate Functions:
Example: 

blog_controller.rb => index
```
def index
  add_breadcrum
  load_hastags
  load_categories
  search_blogs
end

private 
def add_breadcrum
  # code
end
def search_blogs
  # code
end
def load_hastags
  # code
end
def load_categories
  # code
end
```



