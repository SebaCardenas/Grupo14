# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
user = User.new
user.email = 'admin@admin.com'
user.role = 'admin'
user.name = 'admin'
user.password = 'admin1'
user.password_confirmation = 'admin1'
user.save!

user = User.new
user.email = 'juan@gmail.com'
user.role = 'common'
user.name = 'Juan'
user.password = '123456'
user.password_confirmation = '123456'
user.watchedseries = "1,"
user.save!


category_list = ['Other', 'Action', 'Horror', 'Comedy', 'Drama', 'Sci-Fi', 'Politics', 'Kids']

category_list.each do |c|
  cat = Category.new
  cat.name = c
  cat.save!
end

s = Movie.new
s.title = "Prison Breik"
s.description = "Prison Break revolves around two brothers: one who has been sentenced to death for a crime he did not commit and his younger sibling, a genius who devises an elaborate plan to help him escape prison by purposely getting himself imprisoned."
s.country = "US"
s.language = "English"
s.actor = "	Dominic Purcell"
s.director = "Paul Scheuring"
s.n_chapter = 22
s.n_season = 1
s.start_year = DateTime.new(2005, 1, 1)
s.finish_year = DateTime.new(2006, 1, 1)
s.creator = 1
s.category_id = 2
image_path = "#{Rails.root}/app/assets/images/prison-break.jpg"
image_file = File.new(image_path)
s.movie_img = image_file
s.save!

s = Movie.new
s.title = "Lost"
s.description = "This show is about people who are metaphorically lost in their lives, who get on an airplane, and crash on an island, and become physically lost on the planet Earth. And once they are able to metaphorically find themselves in their lives again, they will be able to physically find themselves in the world again."
s.country = "US"
s.language = "English"
s.actor = "Naveen Andrews, Emilie de Ravin, Matthew Fox, Jorge Garcia, Maggie Grace"
s.director = "J.J. Abrams"
s.n_chapter = 23
s.n_season = 3
s.start_year = DateTime.new(2006, 1, 1)
s.finish_year = DateTime.new(2007, 1, 1)
s.creator = 1
s.category_id = 6
image_path = "#{Rails.root}/app/assets/images/lost.jpg"
image_file = File.new(image_path)
s.movie_img = image_file
s.save!

s = Movie.new
s.title = "Friends"
s.description = "Three young men and three young women - of the BFF kind - live in the same apartment complex and face life and love in New York. They're not above sticking their noses into one another's businesses and swapping romantic partners, which always leads to the kind of hilarity average people will never experience - especially during breakups."
s.country = "US"
s.language = "English"
s.actor = 	"Jennifer Aniston, Courteney Cox, Lisa Kudrow, Matt LeBlanc, Matthew Perry, David Schwimmer"
s.director = "David Crane, Marta Kauffman"
s.n_chapter = 24
s.n_season = 5
s.start_year = DateTime.new(1998, 1, 1)
s.finish_year = DateTime.new(1999, 1, 1)
s.creator = 1
s.category_id = 4
image_path = "#{Rails.root}/app/assets/images/friends.jpg"
image_file = File.new(image_path)
s.movie_img = image_file
s.save!

s = Movie.new
s.title = "Modern Family"
s.description = "Told from the perspective of an unseen documentary filmmaker, the series offers an honest, often-hilarious perspective of family life. Parents Phil and Claire yearn for an honest, open relationship with their three kids."
s.country = "US"
s.language = "English"
s.actor = 	"JEd O'Neill, Sofía Vergara, Julie Bowen, Ty Burrell, Jesse Tyler Ferguson"
s.director = "Christopher Lloyd, Steven Levitan"
s.n_chapter = 22
s.n_season = 8
s.start_year = DateTime.new(2016, 1, 1)
s.finish_year = DateTime.new(2017, 1, 1)
s.creator = 1
s.category_id = 4
image_path = "#{Rails.root}/app/assets/images/modern-family.png"
image_file = File.new(image_path)
s.movie_img = image_file
s.save!



# cat = Category.new
# cat.name = 'Horror'
# cat.save!
#
# cat = Category.new
# cat.name = 'Fanrasy'
# cat.save!
#
# cat = Category.new
# cat.name = 'Comedy'
# cat.save!
#
# cat = Category.new
# cat.name = 'Drama'
# cat.save!
#
# cat = Category.new
# cat.name = 'Sci-Fi'
# cat.save!
#
# cat = Category.new
# cat.name = 'Police'
# cat.save!
#
# cat = Category.new
# cat.name = 'Kids'
# cat.save!
