# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

if Cohort.count <= 0
  Cohort.create(id: 1, start_date: 'June', end_date: 'August')
  Cohort.create(id: 2, start_date: 'May', end_date: 'July')
  Cohort.create(id: 3, start_date: 'July', end_date: 'September')
end

if Student.count <= 0
  50.times do
    create(:student)
  end
end

if Employer.count <= 0
  2.times do
    create(:employer)
  end
end
