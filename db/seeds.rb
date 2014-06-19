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
  Cohort.create(id: 3, start_month: 'July', end_month: 'September', image_url: "http://lorempixel.com/100/100")

end

if Student.all.size <= 0
  Student.create(first_name: "Mika", last_name: "Kalathil", cohort_id: 1, bio: "Lorem ipsum ad qui amet dolore, vitae cetero quaerendum mel ea. Facilis fastidii duo no. Viris partiendo ius no, alia animal nam at. Feugait imperdiet ius an, no quis facer lucilius vis. Aliquam saperet contentiones ex pro, id idque offendit ius. Fugit suavitate ad eam, ut essent debitis cum.", image_url: 'http://lorempixel.com/output/people-q-c-195-195-3.jpg')
  Student.create(first_name: "Warren", last_name: "Emptyer", cohort_id: 1, bio: "Lorem ipsum ad qui amet dolore, vitae cetero quaerendum mel ea. Facilis fastidii duo no. Viris partiendo ius no, alia animal nam at. Feugait imperdiet ius an, no quis facer lucilius vis. Aliquam saperet contentiones ex pro, id idque offendit ius. Fugit suavitate ad eam, ut essent debitis cum.", image_url: 'http://lorempixel.com/output/people-q-c-195-195-5.jpg')
  Student.create(first_name: "Mayra", last_name: "Garza", cohort_id: 1, bio: "Lorem ipsum ad qui amet dolore, vitae cetero quaerendum mel ea. Facilis fastidii duo no. Viris partiendo ius no, alia animal nam at. Feugait imperdiet ius an, no quis facer lucilius vis. Aliquam saperet contentiones ex pro, id idque offendit ius. Fugit suavitate ad eam, ut essent debitis cum.", image_url: 'http://lorempixel.com/output/people-q-c-195-195-3.jpg')
  Student.create(first_name: "Marshall", last_name: "Evans", cohort_id: 3, bio: "Lorem ipsum ad qui amet dolore, vitae cetero quaerendum mel ea. Facilis fastidii duo no. Viris partiendo ius no, alia animal nam at. Feugait imperdiet ius an, no quis facer lucilius vis. Aliquam saperet contentiones ex pro, id idque offendit ius. Fugit suavitate ad eam, ut essent debitis cum.", image_url: 'http://lorempixel.com/output/cats-q-c-195-195-7.jpg')
  Student.create(first_name: "Pedro", last_name: "Marquez", cohort_id: 2, bio: "Lorem ipsum ad qui amet dolore, vitae cetero quaerendum mel ea. Facilis fastidii duo no. Viris partiendo ius no, alia animal nam at. Feugait imperdiet ius an, no quis facer lucilius vis. Aliquam saperet contentiones ex pro, id idque offendit ius. Fugit suavitate ad eam, ut essent debitis cum.", image_url: 'http://lorempixel.com/output/animals-q-c-195-195-5.jpg')
  Student.create(first_name: "Chelsey", last_name: "Keller", cohort_id: 3, bio: "Lorem ipsum ad qui amet dolore, vitae cetero quaerendum mel ea. Facilis fastidii duo no. Viris partiendo ius no, alia animal nam at. Feugait imperdiet ius an, no quis facer lucilius vis. Aliquam saperet contentiones ex pro, id idque offendit ius. Fugit suavitate ad eam, ut essent debitis cum.", image_url: 'http://lorempixel.com/output/cats-q-c-195-195-10.jpg')
  Student.create(first_name: "Bobby", last_name: "George", cohort_id: 2, bio: "Lorem ipsum ad qui amet dolore, vitae cetero quaerendum mel ea. Facilis fastidii duo no. Viris partiendo ius no, alia animal nam at. Feugait imperdiet ius an, no quis facer lucilius vis.", image_url: 'http://lorempixel.com/output/people-q-c-195-195-4.jpg')
  Student.create(first_name: "Jordan", last_name: "Krail", cohort_id: 3, bio: "Lorem ipsum ad qui amet dolore, vitae cetero quaerendum mel ea. Facilis fastidii duo no. Viris partiendo ius no, alia animal nam at. Feugait imperdiet ius an, no quis facer lucilius vis.", image_url: 'http://lorempixel.com/output/cats-q-c-195-195-5.jpg')
  Student.create(first_name: "Will", last_name: "Draoi", cohort_id: 2, bio: "Lorem ipsum ad qui amet dolore, vitae cetero quaerendum mel ea. Facilis fastidii duo no. Viris partiendo ius no, alia animal nam at. Feugait imperdiet ius an, no quis facer lucilius vis.", image_url: 'http://lorempixel.com/output/cats-q-c-195-195-9.jpg')
  Student.create(first_name: "Thomas", last_name: "Basrey", cohort_id: 3, bio: "Lorem ipsum ad qui amet dolore, vitae cetero quaerendum mel ea. Facilis fastidii duo no. Viris partiendo ius no, alia animal nam at. Feugait imperdiet ius an, no quis facer lucilius vis.", image_url: 'http://lorempixel.com/output/cats-q-c-195-195-1.jpg')
  Student.create(first_name: "Megan", last_name: "Fasters", cohort_id: 3, bio: "Viris partiendo ius no, alia animal nam at. Feugait imperdiet ius an, no quis facer lucilius vis.", image_url: 'http://lorempixel.com/output/cats-q-c-195-195-2.jpg')
  Student.create(first_name: "Meril", last_name: "Lasrsw", cohort_id: 2, bio: "Viris partiendo ius no, alia animal nam at. Feugait imperdiet ius an, no quis facer lucilius vis.", image_url: 'http://lorempixel.com/output/cats-q-c-195-195-3.jpg')
  Student.create(first_name: "Tim", last_name: "Fally", cohort_id: 1, bio: "Viris partiendo ius no, alia animal nam at. Feugait imperdiet ius an, no quis facer lucilius vis.", image_url: 'http://lorempixel.com/output/cats-q-c-195-195-6.jpg')
end
