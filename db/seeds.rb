# # This file should contain all the record creation needed to seed the database with its default values.
# # The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

# # Examples:

# #   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# #   Character.create(name: 'Luke', movie: movies.first)

# Location.create(province: 'Ho Chi Minh')
# Location.create(province: 'Ha Noi')
# Location.create(province: 'Quang Binh')
# Location.create(province: 'Da Nang')
# Location.create(province: 'Vung Tau')
# Location.create(province: 'Lam Dong')

# Hashtag.create(tag_name: 'Comment')
# Hashtag.create(tag_name: 'View')
# Hashtag.create(tag_name: 'Rating')
# Hashtag.create(tag_name: 'Ramen')
# Hashtag.create(tag_name: 'Photogenic')

# Category.create(category_name: 'Travel')
# Category.create(category_name: 'Work')
# Category.create(category_name: 'Study')
# Category.create(category_name: 'Shopping')  
# Category.create(category_name: 'Food')


# Blog.create(location_id: 1, admin_user_id: 1)
# Blog.create(location_id: 2, admin_user_id: 2)
# Blog.create(location_id: 3, admin_user_id: 1)
# Blog.create(location_id: 4, admin_user_id: 1)
# Blog.create(location_id: 5, admin_user_id: 2)
# Blog.create(location_id: 6, admin_user_id: 1)
Blog.create(location_id: 2, admin_user_id: 2)
Blog.create(location_id: 2, admin_user_id: 2)

# Experience.create(location_id: 1, admin_user_id: 1)
# Experience.create(location_id: 2, admin_user_id: 2)
# Experience.create(location_id: 3, admin_user_id: 2)
# Experience.create(location_id: 4, admin_user_id: 1)
# Experience.create(location_id: 5, admin_user_id: 2)
# Experience.create(location_id: 6, admin_user_id: 1)
# Experience.create(location_id: 2, admin_user_id: 2)

# BlogHashtag.create(blog_id: 1, hashtag_id: 1)
# BlogHashtag.create(blog_id: 1, hashtag_id: 2)
# BlogHashtag.create(blog_id: 2, hashtag_id: 1)
# BlogHashtag.create(blog_id: 2, hashtag_id: 3)
# BlogHashtag.create(blog_id: 2, hashtag_id: 4)
# BlogHashtag.create(blog_id: 3, hashtag_id: 1)
# BlogHashtag.create(blog_id: 4, hashtag_id: 1)
# BlogHashtag.create(blog_id: 4, hashtag_id: 2)
# BlogHashtag.create(blog_id: 4, hashtag_id: 3)

# CategoryBlog.create(blog_id: 1, category_id: 1)
# CategoryBlog.create(blog_id: 1, category_id: 2)
# CategoryBlog.create(blog_id: 1, category_id: 3)
# CategoryBlog.create(blog_id: 2, category_id: 1)
# CategoryBlog.create(blog_id: 3, category_id: 2)
# CategoryBlog.create(blog_id: 3, category_id: 4)
# CategoryBlog.create(blog_id: 4, category_id: 1)
# CategoryBlog.create(blog_id: 4, category_id: 2)
# CategoryBlog.create(blog_id: 4, category_id: 3)
# CategoryBlog.create(blog_id: 5, category_id: 1)

# CategoryExperience.create(experience_id: 1, category_id: 1)
# CategoryExperience.create(experience_id: 1, category_id: 2)
# CategoryExperience.create(experience_id: 1, category_id: 3)
# CategoryExperience.create(experience_id: 2, category_id: 1)
# CategoryExperience.create(experience_id: 3, category_id: 2)
# CategoryExperience.create(experience_id: 3, category_id: 4)
# CategoryExperience.create(experience_id: 4, category_id: 1)
# CategoryExperience.create(experience_id: 4, category_id: 2)
# CategoryExperience.create(experience_id: 4, category_id: 3)
# CategoryExperience.create(experience_id: 5, category_id: 1)

# BlogDetail.create(blog_id: 1, title: 'Blog1', content: '123')
# BlogDetail.create(blog_id: 2, title: 'Blog2', content: '123')
# BlogDetail.create(blog_id: 3, title: 'Blog3', content: '123')
# BlogDetail.create(blog_id: 4, title: 'Blog4', content: '123')
# BlogDetail.create(blog_id: 5, title: 'Blog5', content: '123')
# BlogDetail.create(blog_id: 6, title: 'Blog6', content: '123')
# BlogDetail.create(blog_id: 7, title: 'Blog7', content: '123')

# ExperienceDetail.create(experience_id: 1, title: 'Experience1', price_adult: '12000', price_children: '6000', price_infant: '0', duration: '2 hours', age: '12 and over', language: 'English, Chinese')
# ExperienceDetail.create(experience_id: 2, title: 'Experience2', price_adult: '24000', price_children: '12000', price_infant: '0', duration: '3 hours', age: 'from 6 to 10', language: 'English, Vietnamese')
# ExperienceDetail.create(experience_id: 3, title: 'Experience3', price_adult: '20000', price_children: '10000', price_infant: '0', duration: '2 hours', age: '10 and over', language: 'Vietnamese')
# ExperienceDetail.create(experience_id: 4, title: 'Experience4', price_adult: '12000', price_children: '6000', price_infant: '0', duration: '2 hours', age: 'from 8 to 16', language: 'Chinese')
# ExperienceDetail.create(experience_id: 5, title: 'Experience5', price_adult: '10000', price_children: '5000', price_infant: '0', duration: '1 hours', age: '18 and over', language: 'English, Korean, Chinese')
# ExperienceDetail.create(experience_id: 6, title: 'Experience6', price_adult: '16000', price_children: '8000', price_infant: '0', duration: '2 hours', age: 'from 8 to 16', language: 'English, Korean')
# ExperienceDetail.create(experience_id: 7, title: 'Experience7', price_adult: '28000', price_children: '14000', price_infant: '0', duration: '8 hours', age: '6 and over', language: 'Vietnamese, Chinese')

# Role.create(name: 'admin')
# Role.create(name: 'host')

# AdminUser.create(fullname: 'admin', email: 'admin@example.com', password: '123456', role_id: '1')

# AdminUser.create(fullname: 'admin1', email: 'admin1@example.com', password: '123456', role_id: '2')
