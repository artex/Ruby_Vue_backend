# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# user = User.create(email: "admin@gmail.com", password: "admin@admin")


Post.create!([
    {
      title: "Post 1",
      description: "friend"
    },
    {
      title: "Post 2",
      description: "father"
    },
    {
      title: "Post 3",
      description: "mother"
    },
    {
      title: "Post 4",
      description: "brother"
    },
    {
      title: "Post 5",
      description: "father"
    },
    {
      title: "Post 6",
      description: "mother"
    },
    {
      title: "Post 7",
      description: "brother"
    }
  ])
  p "Created #{Post.count} posts"