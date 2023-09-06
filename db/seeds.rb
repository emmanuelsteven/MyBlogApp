
first_user = User.create(name: 'SteveEmmanuel', photo: 'https://img.freepik.com/premium-photo/close-up-cartoon-character-wearing-headphones-jacket-generative-ai_958098-24830.jpg?w=1480', bio: 'I am steve a fine brave african man that loves coding.')

   second_user = User.create(name: 'MilkyNwoye', photo: 'https://img.freepik.com/premium-photo/close-up-cartoon-character-wearing-headphones-jacket-generative-ai_958098-24830.jpg?w=1480', bio: 'A medical lab scientist and tech guru from Gambia.')

   first_post = Post.create(author: first_user, title: 'Family health', text: 'The current health state of the Nigeria people')

   second_post = Post.create(author: first_user, title: 'Teens right', text: 'teachers need to respect teenagers')

   third_post = Post.create(author: first_user, title: 'Divorce', text: 'marriages end daily in Nigeria')

   fourth_post = Post.create(author: first_user, title: 'pair-programming', text: 'friendship is stronger with coding pairs')

   6.times do 
    Comment.create(post: first_post, author: first_user, text: 'lets make this blog come alive' )
   end

