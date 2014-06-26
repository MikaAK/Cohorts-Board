# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

if Cohort.count <= 0
  Cohort.create(id: 1, start_date: 'June', end_date: 'August', image_url: "http://lorempixel.com/196/196")
  Cohort.create(id: 2, start_date: 'May', end_date: 'July', image_url: "http://lorempixel.com/195/195")
  Cohort.create(id: 3, start_date: 'July', end_date: 'September', image_url: "http://lorempixel.com/196/195")
end

if Student.count <= 0
  50.times do
    create(:student)
  end
end

if Visitor.count <= 0
  2.times do
    create(:visitor)
  end
end

if Admin.count <= 0
  Admin.create(user_name: 'test', first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email)
end
