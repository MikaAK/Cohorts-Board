require 'faker'

include FactoryGirl::Syntax::Methods

def generate_bio
  string = ''
  until string.chars.count >= 220
    string << Faker::Lorem.word << " "
  end
  string
end


FactoryGirl.define do
  sequence(:random_kitten) do
    rand1 = rand(185..195)
    rand2 = rand(185..195)
    'http://placekitten.com' << "/#{rand1}/#{rand2}"
  end

  factory :student, class: Student do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    image_url { FactoryGirl.generate(:random_kitten) }
    github_url { Faker::Internet.url('github.com').gsub /(?<=http).?/, 's:' }
    linkedin_url { Faker::Internet.url 'linkedin.com/in' }
    stackoverflow_url { Faker::Internet.url 'stackoverflow.com/users' }
    short_bio { generate_bio }
    bio { Faker::Lorem.paragraph(2) }
    email { Faker::Internet.free_email }
    cohort_id { rand(1..3) }
  end

  factory :visitor do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
  end
end
