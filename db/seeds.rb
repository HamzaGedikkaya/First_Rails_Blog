# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

    #!Articles
Article.create(title: 'Article1', content: 'lorem')
Article.create(title: 'Article2', content: 'lorem ipsum')
Article.create(title: 'Article3', content: 'lorem ipsum dolor')
Article.create(title: 'Article4', content: 'lorem ipsum dolor sit amet')

#     #!Users
# users = [
#     { email: 'admin@gmail.com', password: '123123' },
#     { email: 'editor@gmail.com', password: '123123' },
#     { email: 'author@gmail.com', password: '123123' },
#     { email: 'user@gmail.com', password: '123123' },
#     { email: 'user2@gmail.com', password: '123123' },

#   ]

# users.each do |user_params|
#   user = User.find_or_create_by(email: user_params[:email]) do |u|
#     u.password = user_params[:password]
#   end
#   puts "Kullanıcı #{user.email} oluşturuldu."
# end

    #!Roles
    
roles = ['admin', 'editor', 'author']

roles.each do |role_name|
  Role.find_or_create_by(name: role_name)
  puts "Rol '#{role_name}' oluşturuldu."
end