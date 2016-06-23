# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'random_data'

6.times do
Topic.create!(
  name: RandomData.random_sentence
)
end
topics = Topic.all
 # Create Posts
 50.times do
 # #1
   Item.create!(
 # #2
     topic:  topics.sample,
     name:  RandomData.random_sentence,
     description:   RandomData.random_paragraph,
     brand: RandomData.random_sentence
   )
 end
 posts = Item.all

 # Create Comments
 # #3

 puts "Seed finished"
 puts "#{Item.count} items created"
 puts "#{Topic.count} topics created"
