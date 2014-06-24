# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'

def generate_bio
  string = ''
  until string.chars.count >= 220
    string << Faker::Lorem.word << " "
  end
  string
end

if Cohort.count <= 0
  Cohort.create(id: 1, start_date: 'June', end_date: 'August', image_url: "http://lorempixel.com/196/196")
  Cohort.create(id: 2, start_date: 'May', end_date: 'July', image_url: "http://lorempixel.com/195/195")
  Cohort.create(id: 3, start_date: 'July', end_date: 'September', image_url: "http://lorempixel.com/196/195")

end

if Student.count <= 0
  Student.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, cohort_id: 1, short_bio: generate_bio, image_url: 'http://placekitten.com/g/194/193', github_url: 'https://github.com/libsiumorisou', linkedin_url: 'https://linkedin.com/lipsiumoffendi', stackoverflow_url: 'https://stackoverflow.com/asdfadsfasdf')
  Student.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, cohort_id: 1, short_bio: generate_bio, image_url: 'http://placekitten.com/g/193/193', github_url: 'https://github.com/libsiumorisou', linkedin_url: 'https://linkedin.com/lipsiumoffendi')
  Student.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, cohort_id: 1, short_bio: generate_bio, image_url: 'http://placekitten.com/g/194/192', github_url: 'https://github.com/libsiumorisou', stackoverflow_url: 'https://stackoverflow.com/asdfadsfasdf')
  Student.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, cohort_id: 3, short_bio: generate_bio, image_url: 'http://placekitten.com/g/193/194', github_url: 'https://github.com/libsiumorisou', linkedin_url: 'https://linkedin.com/lipsiumoffendi')
  Student.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, cohort_id: 2, short_bio: generate_bio, image_url: 'http://placekitten.com/g/192/195', github_url: 'https://github.com/libsiumorisou', linkedin_url: 'https://linkedin.com/lipsiumoffendi', stackoverflow_url: 'https://stackoverflow.com/asdfadsfasdf')
  Student.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, cohort_id: 3, short_bio: generate_bio, image_url: 'http://placekitten.com/g/191/194', github_url: 'https://github.com/libsiumorisou', linkedin_url: 'https://linkedin.com/lipsiumoffendi', stackoverflow_url: 'https://stackoverflow.com/asdfadsfasdf')
  Student.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, cohort_id: 2, short_bio: generate_bio, image_url: 'http://placekitten.com/g/190/195', github_url: 'https://github.com/libsiumorisou', linkedin_url: 'https://linkedin.com/lipsiumoffendi', stackoverflow_url: 'https://stackoverflow.com/asdfadsfasdf')
  Student.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, cohort_id: 3, short_bio: generate_bio, image_url: 'http://placekitten.com/g/194/192', github_url: 'https://github.com/libsiumorisou', linkedin_url: 'https://linkedin.com/lipsiumoffendi')
  Student.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, cohort_id: 2, short_bio: generate_bio, image_url: 'http://placekitten.com/g/195/189', github_url: 'https://github.com/libsiumorisou', linkedin_url: 'https://linkedin.com/lipsiumoffendi', stackoverflow_url: 'https://stackoverflow.com/asdfadsfasdf')
  Student.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, cohort_id: 3, short_bio: generate_bio, image_url: 'http://placekitten.com/g/194/195', github_url: 'https://github.com/libsiumorisou')
  Student.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, cohort_id: 3, short_bio: generate_bio, image_url: 'http://placekitten.com/200/300', github_url: 'https://github.com/libsiumorisou', stackoverflow_url: 'https://stackoverflow.com/asdfadsfasdf')
  Student.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, cohort_id: 2, short_bio: generate_bio, image_url: 'http://placekitten.com/g/200/300', github_url: 'https://github.com/libsiumorisou', linkedin_url: 'https://linkedin.com/lipsiumoffendi', stackoverflow_url: 'https://stackoverflow.com/asdfadsfasdf')
  Student.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, cohort_id: 1, short_bio: generate_bio, image_url: 'http://placekitten.com/g/195/195', github_url: 'https://github.com/libsiumorisou', linkedin_url: 'https://linkedin.com/lipsiumoffendi', stackoverflow_url: 'https://stackoverflow.com/asdfadsfasdf')
end

if Visitor.count <= 0
  Visitor.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email)
end

if Admin.count <= 0
  Admin.create(user_name: 'test', first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email)
end
