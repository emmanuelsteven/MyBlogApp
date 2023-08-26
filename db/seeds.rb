# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
first_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam bibendum, urna ut semper porttitor, mi ex euismod arcu, a euismod magna tortor eu elit. Ut luctus neque eu nunc tincidunt, non tristique justo tempor. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Integer posuere justo at erat vehicula, a ultrices ex facilisis. Donec at nunc venenatis.')
   second_user = User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam bibendum, urna ut semper porttitor, mi ex euismod arcu, a euismod magna tortor eu elit. Ut luctus neque eu nunc tincidunt, non tristique justo tempor. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Integer posuere justo at erat vehicula, a ultrices ex facilisis. Donec at nunc venenatis.')

   first_post = Post.create(author: first_user, title: 'Hello', text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam bibendum, urna ut semper porttitor, mi ex euismod arcu, a euismod magna tortor eu elit. Ut luctus neque eu nunc tincidunt, non tristique justo tempor. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Integer posuere justo at erat vehicula, a ultrices ex facilisis. Donec at nunc venenatis')

   second_post = Post.create(author: first_user, title: 'Hello', text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam bibendum, urna ut semper porttitor, mi ex euismod arcu, a euismod magna tortor eu elit. Ut luctus neque eu nunc tincidunt, non tristique justo tempor. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Integer posuere justo at erat vehicula, a ultrices ex facilisis. Donec at nunc venenatis')

   third_post = Post.create(author: first_user, title: 'Hello', text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam bibendum, urna ut semper porttitor, mi ex euismod arcu, a euismod magna tortor eu elit. Ut luctus neque eu nunc tincidunt, non tristique justo tempor. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Integer posuere justo at erat vehicula, a ultrices ex facilisis. Donec at nunc venenatis')

   fourth_post = Post.create(author: first_user, title: 'Hello', text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam bibendum, urna ut semper porttitor, mi ex euismod arcu, a euismod magna tortor eu elit. Ut luctus neque eu nunc tincidunt, non tristique justo tempor. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Integer posuere justo at erat vehicula, a ultrices ex facilisis. Donec at nunc venenatist')

   6.times do 
    Comment.create(post: first_post, author: second_user, text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam bibendum.' )
   end

