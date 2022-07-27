# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require_relative '../lib/populator_fix.rb'

curr_user = User.first

=begin
Person.populate 10 do |person|
  person.name = "#{Faker::Name.first_name} #{Faker::Name.last_name}"
  person.phone = Faker::PhoneNumber.phone_number
  person.email = Faker::Internet.email
  person.web = Faker::Internet.url
  person.twitter = Faker::Twitter.screen_name
  person.about = Faker::Hipster.paragraph
  person.user_id = curr_user.id
end

Company.populate 10 do |company|
  company.name = Faker::Company.name
  company.about = "#{Faker::Company.catch_phrase}. #{Faker::Company.catch_phrase}. #{Faker::Company.catch_phrase}."
  company.address = Faker::Address.full_address
  company.phone = Faker::PhoneNumber.phone_number
  company.web = Faker::Internet.url
  company.user_id = curr_user.id
end
=end

Person.all.each do |person_for_link|
  rend_indx = rand(1..10)
  company = Company.all[rend_indx]
  link = CompanyPerson.new
  link.person = person_for_link
  link.company = company
  link.role = Faker::Company.profession
  link.save
end

CompanyPerson.all.each do |comp_person|
  project = Opportunity.new
  project.title = Faker::Commerce.product_name
  project.start = Date.current
  project.finish = Date.current + 5.days
  project.description = Faker::Hipster.paragraph
  project.stage = rand(4)
  project.status = rand(3)
  project.company = comp_person.company
  project.person = comp_person.person
  project.user = curr_user
  project.amount = rand(500.5..1500.5)
  project.save
end