# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# %w(and dna dan nda).each do |name|
#   email = "#{name}@#{name}.com"
#   next if User.exists? email: email
#   User.create!(email: email, password: 'abc123',
#                password_confirmation: 'abc123')
# end

User.delete_all
Profile.delete_all
Image.delete_all

kayla = User.create!(email: 'kayla@kay.com', password: 'kayla', password_confirmation: 'kayla')

kayla.create_profile(first_name: 'Kayla', last_name: 'Lei', description: 'I like to draw')

kayla.profile.images.create!(caption: 'Inktober Day 1')
