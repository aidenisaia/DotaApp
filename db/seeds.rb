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

timings = ["Starting", "Early", "Mid", "Late"]

response = HTTP.get("https://api.steampowered.com/IEconDOTA2_570/GetHeroes/v0001/?key=#{Rails.application.credentials.api_key}").parse(:json)["result"]["heroes"]

heroes = []
response.each do |hero|
  heroes << hero
end

heroes.each do |hero|
  hero["name"] = hero["name"].sub('npc_dota_hero_', '')
  hero["url"] = "http://cdn.dota2.com/apps/dota2/images/heroes/#{hero['name']}_sb.png"
end

5.times do
  hero = heroes.sample
  Build.create!(
    user_id: user_ids.sample,
    timing: timings.sample,
    hero_name: hero["name"],
    hero_url: hero["url"]
  )
end

builds = Build.all

response2 = HTTP.get("https://api.steampowered.com/IEconDOTA2_570/GetGameItems/V001/?key=#{Rails.application.credentials.api_key}&language=LANGCODE").parse(:json)["result"]["items"]

response_items = []
response2.each do |item|
  if item["recipe"] == 0
    response_items << item
  end
end

response_items.each do |item|
  item["name"] = item["name"].sub('item_', '')
  item["url"] = "http://cdn.dota2.com/apps/dota2/images/items/#{item['name']}_lg.png"
end

builds.each do |build|
  4.times do
    item = response_items.sample
    Item.create!(
      item_name: item["name"],
      build_id: build.id,
      url: item["url"]
    )
  end
end

builds = Build.all
build_ids = []
builds.each do |build|
  build_ids << build.id
end

5.times do
  Post.create!(
  user_id: user_ids.sample,
  title: Faker::Lorem.sentence(word_count: 3, supplemental: true),
  body: Faker::Lorem.paragraph(sentence_count: 5, supplemental: true),
  build_id: build_ids.sample
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