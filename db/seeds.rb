# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
5.times do
  Hawker.create(
    name: Faker::Restaurant.unique.name,
    description: Faker::Restaurant.description,
    address: Faker::Address.street_address,
    hero_image_url: 'https://zone-thebestsingapore-bhxtb9xxzrrdpzhqr.netdna-ssl.com/wp-content/uploads/2014/07/Best-Hawker-Centre.jpg',
    opening_hours: '0800',
    closing_hours: '2000',
    latitude: Faker::Number.normal(1.318758, 0.027802).round(6),
    longitude: Faker::Number.normal(103.817283, 0.077934).round(6)
  )
end



Hawker.first.comments << Comment.create(date: '10/20/2019', rating: '5', text: 'first comment')
Hawker.first.comments << Comment.create(date: '10/20/2019', rating: '4', text: 'second comment')
Hawker.first.comments << Comment.create(date: '10/20/2019', rating: '3', text: 'third comment')
Hawker.first.comments << Comment.create(date: '10/20/2019', rating: '2', text: 'fourth comment')
Hawker.first.comments << Comment.create(date: '10/20/2019', rating: '1', text: 'fifth comment')
Hawker.first.comments << Comment.create(date: '10/20/2019', rating: '0', text: 'sixth comment')