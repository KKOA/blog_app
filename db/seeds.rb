# This file should contain all the record creation needed to seed the database
# with its default values.
# The data can then be loaded with the rails db:seed command
# (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create(
#     [
#       { name: 'Star Wars' },
#       { name: 'Lord of the Rings' }
#     ]
#   )
#   Character.create(
#     name: 'Luke',
#     movie: movies.first
#   )

# Dummy Users
user1 = User.new
user1.email = 'john@example.com'
user1.password = 'pepsimax'
user1.password_confirmation = 'pepsimax'
user1.save!

user2 = User.new
user2.email = 'louisa@example.com'
user2.password = 'prayer'
user2.password_confirmation = 'prayer'
user2.save!

user3 = User.new
user3.email = 'samuel@example.com'
user3.password = 'makers'
user3.password_confirmation = 'makers'
user3.save!

user4 = User.new
user4.email = 'david@example.com'
user4.password = 'sharpie'
user4.password_confirmation = 'sharpie'
user4.save!

user5 = User.new
user5.email = 'amy@example.com'
user5.password = 'sparkle'
user5.password_confirmation = 'sparkle'
user5.save!

# Dummy articles

Article.where(title: 'First Article').first_or_create(
  title: 'First Article',
  body: Faker::Lorem.unique.paragraph(5, true, 4),
  user_id: user1.id
)

Article.where(title: 'Second Article').first_or_create(
  title: 'Second Article',
  body: Faker::Lorem.unique.paragraph(5, true, 5),
  user_id: user2.id
)

Article.where(title: 'Third Article').first_or_create(
  title: 'Third Article',
  body: Faker::Lorem.unique.paragraph(5, true, 2),
  user_id: user1.id
)
#
Article.where(title: 'Fourth Article').first_or_create(
  title: 'Fourth Article',
  body: Faker::Lorem.unique.paragraph(5, true, 3),
  user_id: user3.id
)
#
Article.where(title: 'Fifth Article').first_or_create(
  title: 'Fifth Article',
  body: Faker::Lorem.unique.paragraph(5, true, 1),
  user_id: user2.id
)

Article.where(title: 'Sixth Article').first_or_create(
  title: 'Sixth Article',
  body: Faker::Lorem.unique.paragraph(5, true, 7),
  user_id: user1.id
)

Article.where(title: 'Seventh Article').first_or_create(
  title: 'Seventh Article',
  body: Faker::Lorem.unique.paragraph(5, true, 1),
  user_id: user2.id
)
#
Article.where(title: 'Eighth Article').first_or_create(
  title: 'Eighth Article',
  body: Faker::Lorem.unique.paragraph(5, true, 2),
  user_id: user4.id
)

Article.where(title: 'Nineth Article').first_or_create(
  title: 'Nineth Article',
  body: Faker::Lorem.unique.paragraph(1, true, 4),
  user_id: user3.id
)

Article.where(title: 'Tenth Article').first_or_create(
  title: 'Tenth Article',
  body: Faker::Lorem.unique.paragraph(9, true, 3),
  user_id: user1.id
)
