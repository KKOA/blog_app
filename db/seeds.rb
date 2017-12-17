# This file should contain all the record creation needed to seed the database
# with its default values.
# The data can then be loaded with the rails db:seed command
# (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Dummy Users
user1 = User.new
user1.email = 'john@example.com'
user1.password ='pepsimax'
user1.password_confirmation ='pepsimax'
user1.save!

user2 = User.new
user2.email = 'louisa@example.com'
user2.password ='prayer'
user2.password_confirmation ='prayer'
user2.save!

user3 = User.new
user3.email = 'samuel@example.com'
user3.password ='makers'
user3.password_confirmation ='makers'
user3.save!

user4 = User.new
user4.email = 'david@example.com'
user4.password ='sharpie'
user4.password_confirmation ='sharpie'
user4.save!

user5 = User.new
user5.email = 'amy@example.com'
user5.password ='sparkle'
user5.password_confirmation ='sparkle'
user5.save!

# Dummy articles
Article.where(title: 'First Article').first_or_create(title: 'First Article',
   body: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris ut ante ante.
   Cras a sem ac felis pulvinar mollis quis non quam. Nullam lacus ligula, tristique sit amet justo eget, eleifend congue erat.
   Pellentesque eu sem ut sem venenatis congue. Integer vehicula urna ut leo consectetur feugiat.
   Nulla commodo ornare est non molestie. Etiam dignissim metus felis, nec fermentum lacus ullamcorper et.
   Nulla facilisi. Mauris nec nisi sodales, varius ligula vitae, facilisis neque. Cras sed vehicula nulla, in pharetra justo.
   Donec sed mi non est pellentesque accumsan a non urna. Sed luctus, nisi in pellentesque dignissim, elit velit fermentum quam, vitae ornare lacus tellus sed libero.
   Morbi accumsan hendrerit eros et suscipit. Aenean nec nibh lorem.',
   user_id: user1.id)


 Article.where(title: 'Second Article').first_or_create(title: 'Second Article',
    body: 'Mauris at gravida neque, eget mattis purus. Praesent et iaculis quam. Donec a urna vitae urna iaculis congue.
    Vestibulum at ante fringilla, scelerisque tellus sit amet, vulputate lacus.
    usce lobortis, orci id pretium feugiat, ipsum turpis lacinia purus, at sollicitudin ipsum arcu vitae eros.
    In scelerisque eu magna eget eleifend.
    Suspendisse justo sapien, porta id elementum vitae, blandit sed augue.',
    user_id: user2.id)

Article.where(title: 'Third Article').first_or_create(title: 'Third Article',
   body: 'Donec a metus augue. Interdum et malesuada fames ac ante ipsum primis in faucibus.
   Aliquam placerat libero ut neque porttitor molestie. Mauris et ullamcorper ex.
   Vestibulum odio velit, pulvinar ut fermentum quis, interdum nec lorem.
   Nulla venenatis metus vel ullamcorper laoreet. Praesent eu enim et neque commodo gravida sed sed massa.
   Duis placerat sed odio sit amet interdum.
   Quisque lacus sem, venenatis eget eros ut, mollis porttitor velit.',
   user_id: user1.id)
#
Article.where(title: 'Fourth Article').first_or_create(title: 'Fourth Article',
   body: 'Vestibulum id fringilla tellus. Cras condimentum maximus congue. Morbi placerat dui at mauris congue, sed sodales est pretium.
   Cras vel felis mauris. Integer id vestibulum ante. Vestibulum quis vehicula dui, ac aliquam nisi.
   Vivamus erat urna, vestibulum sit amet nisl ac, sodales consequat dolor. Integer ante diam, aliquam sed nunc vitae, posuere pharetra justo.
   Morbi laoreet viverra augue, vitae tempor orci laoreet vitae. Aliquam varius sem et libero rhoncus sollicitudin.',
   user_id: user3.id)
#
Article.where(title: 'Fifth Article').first_or_create(title: 'Fifth Article',
   body: 'Cras a arcu nisl. Phasellus id rutrum lorem. Ut ornare eu justo non sodales. Nam volutpat dapibus malesuada.
   Aenean malesuada eros id ipsum vestibulum tempus. Sed dolor arcu, sagittis sed consequat non, varius eu nisi. Fusce fringilla sed lorem ornare ornare.',
   user_id: user2.id
 )

Article.where(title: 'Sixth Article').first_or_create(title: 'Sixth Article',
   body: 'Integer mauris tortor, fermentum egestas arcu nec, efficitur fringilla ex. Nullam molestie et metus et tincidunt. Donec sit amet pretium nulla.
   Phasellus nec rhoncus nulla. Cras efficitur, orci id mattis lobortis, sem eros mollis est, vel mattis erat metus eget erat.
   Nam at justo ut nisi pretium vulputate vitae ut nisi. Duis id felis quis nisi cursus egestas eu feugiat nisi.
   Curabitur ante nisi, placerat euismod elit tincidunt, placerat maximus ipsum. Nulla ut purus molestie, tincidunt ex et, ullamcorper nisl.
   Praesent luctus enim nec nisi porttitor vehicula. Sed interdum laoreet massa id hendrerit. Praesent pretium imperdiet neque, sit amet pulvinar elit ornare vel.
   In tortor dui, volutpat eget luctus sit amet, mollis sed mi. In consequat semper nisl, non ullamcorper ante scelerisque ut.
   Sed pulvinar placerat purus, ut posuere libero pulvinar nec.',
    user_id: user1.id
)

Article.where(title: 'Seventh Article').first_or_create(title: 'Seventh Article',
   body: 'Nunc tristique fermentum elit in semper. Donec sodales cursus mattis. Aliquam nulla lacus, auctor vehicula accumsan vitae, commodo a ipsum.
   Maecenas maximus ut ante sit amet tincidunt. Aliquam eu sem nec libero dapibus malesuada. Integer odio odio, finibus eu lacinia eget, rhoncus quis leo.
   Fusce porttitor velit ut pulvinar elementum.',
   user_id: user2.id
)
#
Article.where(title: 'Eighth Article').first_or_create(title: 'Eighth Article',
   body: 'Cras nibh purus, volutpat vitae tortor non, volutpat blandit risus. Nullam fermentum vel lorem eu fringilla.
   Mauris aliquam felis quis felis varius molestie. Quisque eget viverra nulla. Proin venenatis ullamcorper dolor, sed elementum mi sollicitudin non.
   Cras imperdiet, nulla at maximus elementum, tortor sem dictum neque, a egestas magna diam a nulla. Morbi scelerisque feugiat hendrerit.
   Maecenas risus justo, hendrerit quis massa in, sodales porttitor erat. Curabitur commodo tincidunt eros.
   In nec urna vitae ligula feugiat ultricies a et arcu. Nam ullamcorper volutpat dignissim. Vestibulum at erat leo.
   Duis purus ipsum, cursus vel nisi et, sollicitudin mollis quam.',
   user_id:user4.id
 )

Article.where(title: 'Nineth Article').first_or_create(title: 'Nineth Article',
   body: 'Mauris vulputate justo nunc, eget viverra tortor scelerisque at. Curabitur fermentum neque eros, vel eleifend tellus egestas et.
   Suspendisse nisl mauris, lacinia non augue sed, laoreet finibus enim. Cras sagittis cursus libero, eget condimentum metus sollicitudin ac.
   Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.
   Nulla vehicula ex mauris, quis varius quam semper euismod. In posuere finibus nisl sit amet molestie.
   Pellentesque pellentesque blandit ex in fermentum. Quisque eget leo ornare, blandit nulla scelerisque, tincidunt lectus. Nam quis luctus est, ut volutpat ante.
   Ut elementum dapibus sodales. Nunc quis vulputate tellus. Phasellus ac finibus enim.',
   user_id:user3.id
)

Article.where(title: 'Tenth Article').first_or_create(title: 'Tenth Article',
   body: 'Nunc lorem enim, commodo nec consectetur vel, ullamcorper quis sapien. Nulla facilisi. Duis tempus augue lobortis, volutpat arcu non, posuere sem.
   Nullam metus lacus, blandit vel fringilla et, ultricies a erat. Donec ac metus in lectus bibendum porta eget a odio.
   Suspendisse rhoncus suscipit orci, eu finibus metus facilisis id. Nullam ante elit, bibendum id quam lobortis, blandit elementum dolor.
   Cras aliquet eget nibh et varius. Vivamus vitae leo quis lectus elementum rutrum vel semper ligula.
   Etiam dignissim odio ut varius molestie. Suspendisse dolor enim, rhoncus eu purus non, tempus molestie dui.
   Maecenas dapibus hendrerit aliquam. Mauris molestie dictum elit, et faucibus ante consequat ut.',
user_id:user1.id)
