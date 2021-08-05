# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

User.create!(
  username: 'pudge',
  email: 'pudge@gmail.com',
  password: 'password'
)
User.create!(
  username: 'axe',
  email: 'axe@gmail.com',
  password: 'password'
)
User.create!(
  username: 'kunkka',
  email: 'kunkka@gmail.com',
  password: 'password'
)
User.create!(
  username: 'tidehunter',
  email: 'tidehunter@gmail.com',
  password: 'password'
)

users = User.all
user_ids = []
users.each do |user|
  user_ids << user.id
end

5.times do
  Post.create!(
  user_id: user_ids.sample,
  title: Faker::Lorem.sentence(word_count: 3, supplemental: true),
  body: Faker::Lorem.paragraph(sentence_count: 3, supplemental: true)
  )
end

posts = Post.all
post_ids = []
posts.each do |post|
  post_ids << post.id
end

8.times do
  user = users.sample
  Comment.create!(
    user_id: user.id,
    post_id: post_ids.sample,
    body: Faker::Games::Dota.quote(hero: "#{user.username}")
  )
end