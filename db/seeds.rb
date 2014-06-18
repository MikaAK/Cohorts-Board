# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

if Cohort.all.size <= 0
  Cohort.create(id: 1, start_month: 'June', end_month: 'August', image_url: "http://lorempixel.com/100/100")
  Cohort.create(id: 2, start_month: 'May', end_month: 'July', image_url: "http://lorempixel.com/100/100")
end

if Student.all.size <= 0
  Student.create(first_name: "Mika", last_name: "Kalathil", cohort_id: 1, bio: "My name is bob, test test 123", image_url: 'http://lorempixel.com/output/people-q-c-100-100-2.jpg')
  Student.create(first_name: "Warren", last_name: "Emptyer", cohort_id: 1, bio: "My name is bob, test test 123", image_url: 'http://lorempixel.com/output/people-q-c-100-100-8.jpg')
  Student.create(first_name: "Bobby", last_name: "George", cohort_id: 2, bio: "My name is bob, test test 123", image_url: 'http://lorempixel.com/output/people-q-c-100-100-9.jpg')
end
