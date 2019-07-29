# # # This file should contain all the record creation needed to seed the database with its default values.
# # # The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

# # # Examples:

# # #   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# # #   Character.create(name: 'Luke', movie: movies.first)
Role.create(name: 'admin')
Role.create(name: 'host')
puts "Insert finished Role"
AdminUser.create(fullname: 'admin', email: 'abc@example.com', password: '123456', role_id: '1')
puts "Insert finished AdminUser"

Role.create(name: 'admin')
Role.create(name: 'host')

AdminUser.create(fullname: 'admin', email: 'abc@example.com', password: '123456', role_id: '1')

Location.create(province: 'Ho Chi Minh')
Location.create(province: 'Ha Noi')
Location.create(province: 'Quang Binh')
Location.create(province: 'Da Nang')
Location.create(province: 'Vung Tau')
Location.create(province: 'Lam Dong')
puts "Insert finished Location"

Hashtag.create(tag_name: 'Comment')
Hashtag.create(tag_name: 'View')
Hashtag.create(tag_name: 'Rating')
Hashtag.create(tag_name: 'Ramen')
Hashtag.create(tag_name: 'Photogenic')
puts "Insert finished HashTag"

Category.create(category_name: 'Travel')
Category.create(category_name: 'Work')
Category.create(category_name: 'Study')
Category.create(category_name: 'Shopping')  
Category.create(category_name: 'Food')
puts "Insert finished Category"

# 
Blog.create(location_id: 1, admin_user_id: 1, title: "Blog 1", short_description: "The sad incompetent witnesses Blog 1 throughout the highway. Blog 1 interprets Blog 1. Blog 1 spites Blog 1 over the finger. Blog 1 malfunctions around the rag.", content: "When will the sugar fellow Blog 1? Can her twisted antidote chew outside Blog 1? When will Blog 1 export a royal? A broke thought civilizes Blog 1 above a reckless turnround.")
Blog.create(location_id: 2, admin_user_id: 1, title: "Blog 2", short_description: "The debugger chords Blog 2. Blog 2 paints the photocopy beside my atmospheric symbol. The dogma offends after my lawyer. The loved threat expires beside the virus. Does Blog 2 rest near its pedantry?", content: "The proof stalls without the holder. The shot mandates Blog 2 outside an angel. How can Blog 2 accept around Blog 2? Without my transcript dashes the transmitted skin. Should Blog 2 nose? The profile collects Blog 2.")
Blog.create(location_id: 3, admin_user_id: 1, title: "Blog 3", short_description: "
Blog 3 dresses a fundamentalist country into a crazy insect. Will a postscript reside beneath Blog 3? Can Blog 3 spin? Why can't a wonder lie beneath Blog 3? Blog 3 mobs Blog 3 against an organic technology.", content: "
The competitor jokes past the ethical book. Blog 3 runs with Blog 3. Blog 3 stocks the fuse next to my postponed comparison. Blog 3 upgrades Blog 3 outside a confined flag. Blog 3 traces the reported committee. This diet rocks inside your attendant.")
Blog.create(location_id: 4, admin_user_id: 1, title: "Blog 4", short_description: "Will the skeleton exercise? Blog 4 surrounds Blog 4 around the wish. The neural wind pumps beside the early furniture. Blog 4 signs the verified caffeine against the clean dye. Blog 4 triggers Blog 4 under the portable spectrum. The tidy sheep punches Blog 4.", content: "Blog 4 dashes beneath Blog 4. The appendix kids past the component! The poet breads Blog 4 over the meaningless jungle. Blog 4 behaves below Blog 4. A sniff dictates? Blog 4 attains Blog 4 underneath the fallen organ.")
Blog.create(location_id: 5, admin_user_id: 1, title: "Blog 5", short_description: "How does the daft composer smile? Around Blog 5 aborts the horrific manufacturer. The cricket muddles the daughter past the some drum. Blog 5 rattles Blog 5 inside a million fuss. Should Blog 5 steal her demonstrated guidance? Why can't the pompous boat suppose the interference?", content: "Blog 5 evolves an intelligent dispute under a logo. Around Blog 5 chews Blog 5. An unconscious studies within a downhill. Why does Blog 5 defect under Blog 5?")
Blog.create(location_id: 6, admin_user_id: 1, title: "Blog 6", short_description: "When will Blog 6 gasp? Will Blog 6 walk beneath Blog 6? Blog 6 displays Blog 6. The disgusted grandfather starves underneath the disturbed east.", content: "Blog 6 grinds Blog 6. Behind the kept clock enters the headed musician. Blog 6 predicts the viewer under the just initiate. The name rattles inside Blog 6. Blog 6 relates to her pitfall across the wide supermarket. The deterrent adjective toes a men's thoroughfare.")
Blog.create(location_id: 2, admin_user_id: 1, title: "Blog 7", short_description: "Blog 7 stamps in Blog 7. An outline overflows. The slang duplicates the or family. Blog 7 pieces Blog 7. Blog 7 travels Blog 7.", content: "Blog 7 fumes our knee over a constraint. The steam exhausts a wrath. Why does Blog 7 arrive? The insane brush relates to the irony around a publicized outcome.
")
puts "Insert finished Blog"

Experience.create(location_id: 1, admin_user_id: 1, title: 'Experience 1',price_adult: 500, price_children: 250, price_infant: 0, duration: "8 hours", age: "18 -25", language: "Vietnamese and English", short_description: "A grown talent chairs Experience 1. Experience 1 requests the sport near an orient aunt. The glowing dream finalizes Experience 1 beneath the whole. How will the overpriced horde behave outside Experience 1?", description: "
The slag abuses Experience 1 after the gateway. How does the classic goodbye crawl below a shape? Experience 1 adapts an enthusiastic agony below a diverting blessed. Experience 1 parades past Experience 1. Why can't Experience 1 doom Experience 1? Experience 1 rails after an overpriced adviser.")
Experience.create(location_id: 2, admin_user_id: 1, title: 'Experience 2',price_adult: 600, price_children: 350, price_infant: 0, duration: "10 hours", age: "18 -26", language: "Vietnamese and English and Japanese", short_description: "Experience 2 flashes outside Experience 2. Experience 2 decays. Experience 2 modifies Experience 2. Experience 2 screams above whatever effort. The acoustic corpse sighs opposite a concealed overload.", description: "
Will the blade scream with the healthy drill? A node marches! An elevator zooms outside Experience 2. Experience 2 sticks Experience 2 past the pleased kernel. Below the tiger stamps an extremist. Experience 2 deprives the household opposite the hopeful journal.")
Experience.create(location_id: 3, admin_user_id: 1, title: 'Experience 3',price_adult: 700, price_children: 450, price_infant: 0, duration: "12 hours", age: "18 -27", language: "Vietnamese and English and Japanese", short_description: "Experience 3 argues a doe inside a horrid cousin. The orienting essence steals Experience 3. Can Experience 3 talk underneath Experience 3? When can Experience 3 pose past a warm slice?", description: "Experience 3 argues a doe inside a horrid cousin. The orienting essence steals Experience 3. Can Experience 3 talk underneath Experience 3? When can Experience 3 pose past a warm slice?")
Experience.create(location_id: 4, admin_user_id: 1, title: 'Experience 4',price_adult: 200, price_children: 100, price_infant: 0, duration: "3 hours", age: "18 -27", language: "Vietnamese and English and Japanese", short_description: "Experience 4 bucks across the wrecker. The breeding researcher weights the well without a scratch optic. Experience 4 executes a sword past the studio. Every supplier emerges! Experience 4 visits Experience 4 outside a western gun.", description: "A sea alerts Experience 4 against a counsel. Opposite the prostitute raves Experience 4. The skin purges without Experience 4. Should an alcohol jump Experience 4?")
Experience.create(location_id: 5, admin_user_id: 1, title: 'Experience 5',price_adult: 250, price_children: 140, price_infant: 0, duration: "4 hours", age: "18 - 20", language: "Vietnamese and English and Japanese", short_description: "The valve concatenates Experience 5. Experience 5 fumes a thirst near the epic freeze. The overflow rings Experience 5. Experience 5 delays a ribbon above an orient academic.", description: "A container works Experience 5 beside the street. Experience 5 chases the believer over a typesetting contempt. Experience 5 shells Experience 5. The cell triumphs after Experience 5.")
Experience.create(location_id: 6, admin_user_id: 1, title: 'Experience 6',price_adult: 550, price_children: 340, price_infant: 0, duration: "7 hours", age: "18 - 23", language: "Vietnamese and English and Japanese", short_description: "Experience 6 stirs without Experience 6. Does the fear relax beneath Experience 6? Experience 6 acts. Beneath Experience 6 participates Experience 6. Experience 6 multiplies.", description: "The developed sunlight inhabits Experience 6. Experience 6 loosens Experience 6. Experience 6 breaks into Experience 6. Experience 6 fusses opposite a twisted hail. Experience 6 nicks Experience 6 against every structured freeze.")

Experience.create(location_id: 2, admin_user_id: 1, title: 'Experience 7',price_adult: 650, price_children: 340, price_infant: 0, duration: "7,5 hours", age: "18 - 23", language: "Vietnamese and English and Japanese", short_description: "An envy beefs Experience 7. A highway bankrupts Experience 7. When can Experience 7 beef the giant luggage? Will the award qualify Experience 7? The bulb braves its radical.", description: "A hazy iron groans on top of Experience 7. Will Experience 7 scream beside the march? Experience 7 reflects the ego opposite the overlooking cartridge. An expiring tube inhabits the deaf unconscious. Experience 7 perfects a badge under the weird opera.")

puts "Insert finished Experience"


BlogHashtag.create(blog_id: 1, hashtag_id: 1)
BlogHashtag.create(blog_id: 1, hashtag_id: 2)
BlogHashtag.create(blog_id: 2, hashtag_id: 1)
BlogHashtag.create(blog_id: 2, hashtag_id: 3)
BlogHashtag.create(blog_id: 2, hashtag_id: 4)
BlogHashtag.create(blog_id: 3, hashtag_id: 1)
BlogHashtag.create(blog_id: 4, hashtag_id: 1)
BlogHashtag.create(blog_id: 4, hashtag_id: 2)
BlogHashtag.create(blog_id: 4, hashtag_id: 3)
BlogHashtag.create(blog_id: 5, hashtag_id: 1)
BlogHashtag.create(blog_id: 5, hashtag_id: 2)
BlogHashtag.create(blog_id: 5, hashtag_id: 5)
BlogHashtag.create(blog_id: 6, hashtag_id: 1)
BlogHashtag.create(blog_id: 6, hashtag_id: 2)
BlogHashtag.create(blog_id: 6, hashtag_id: 4)
BlogHashtag.create(blog_id: 7, hashtag_id: 1)
BlogHashtag.create(blog_id: 7, hashtag_id: 2)
BlogHashtag.create(blog_id: 7, hashtag_id: 3)
BlogHashtag.create(blog_id: 7, hashtag_id: 4)
BlogHashtag.create(blog_id: 7, hashtag_id: 5)
puts "Insert finished BlogHashtag"

CategoryBlog.create(blog_id: 1, category_id: 1)
CategoryBlog.create(blog_id: 1, category_id: 2)
CategoryBlog.create(blog_id: 1, category_id: 3)
CategoryBlog.create(blog_id: 2, category_id: 1)
CategoryBlog.create(blog_id: 3, category_id: 2)
CategoryBlog.create(blog_id: 3, category_id: 4)
CategoryBlog.create(blog_id: 4, category_id: 1)
CategoryBlog.create(blog_id: 4, category_id: 2)
CategoryBlog.create(blog_id: 4, category_id: 3)
CategoryBlog.create(blog_id: 5, category_id: 1)
CategoryBlog.create(blog_id: 6, category_id: 3)
CategoryBlog.create(blog_id: 7, category_id: 1)

puts "Insert finished CategoryBlog"
CategoryExperience.create(experience_id: 1, category_id: 1)
CategoryExperience.create(experience_id: 1, category_id: 2)
CategoryExperience.create(experience_id: 1, category_id: 3)
CategoryExperience.create(experience_id: 2, category_id: 1)
CategoryExperience.create(experience_id: 3, category_id: 2)
CategoryExperience.create(experience_id: 3, category_id: 4)
CategoryExperience.create(experience_id: 4, category_id: 1)
CategoryExperience.create(experience_id: 4, category_id: 2)
CategoryExperience.create(experience_id: 4, category_id: 3)
CategoryExperience.create(experience_id: 5, category_id: 1)
CategoryExperience.create(experience_id: 6, category_id: 5)
CategoryExperience.create(experience_id: 7, category_id: 5)
puts "Insert finished CategoryExperience"

ExperienceDate.create(expFrom: '03/08/2019', expTo: '05/08/2019', month: '8', year: '2019', experience_id: '2')
ExperienceDate.create(expFrom: '07/08/2019', expTo: '07/08/2019', month: '8', year: '2019', experience_id: '2')
ExperienceDate.create(expFrom: '10/09/2019', expTo: '11/09/2019', month: '9', year: '2019', experience_id: '2')
ExperienceDate.create(expFrom: '12/06/2019', expTo: '14/07/2019', month: '7', year: '2019', experience_id: '2')
ExperienceDate.create(expFrom: '01/08/2019', expTo: '02/08/2019', month: '8', year: '2019', experience_id: '4')
ExperienceDate.create(expFrom: '04/08/2019', expTo: '06/08/2019', month: '8', year: '2019', experience_id: '4')
ExperienceDate.create(expFrom: '03/08/2019', expTo: '03/08/2019', month: '8', year: '2019', experience_id: '5')
ExperienceDate.create(expFrom: '05/08/2019', expTo: '05/08/2019', month: '8', year: '2019', experience_id: '5')
ExperienceDate.create(expFrom: '07/08/2019', expTo: '07/08/2019', month: '8', year: '2019', experience_id: '5')
ExperienceDate.create(expFrom: '01/09/2019', expTo: '03/10/2019', month: '10', year: '2019', experience_id: '1')
ExperienceDate.create(expFrom: '08/10/2019', expTo: '10/10/2019', month: '10', year: '2019', experience_id: '1')
puts "Insert finished ExperienceDate"

