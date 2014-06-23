# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

if Cohort.all.size <= 0
  Cohort.create(id: 1, start_date: 'June', end_date: 'August', image_url: "http://lorempixel.com/196/196")
  Cohort.create(id: 2, start_date: 'May', end_date: 'July', image_url: "http://lorempixel.com/195/195")
  Cohort.create(id: 3, start_date: 'July', end_date: 'September', image_url: "http://lorempixel.com/196/195")

end

if Student.all.size <= 0
  Student.create(first_name: "Mika", last_name: "Kalathil", cohort_id: 1, bio: "Lorem ipsum ad qui amet dolore, vitae cetero quaerendum mel ea. Facilis fastidii duo no. Viris partiendo ius no, alia animal nam at. Feugait imperdiet ius an, no quis facer lucilius vis. Aliquam saperet contentiones ex pro, id idque offendit ius. Fugit suavitate ad eam, ut essent debitis cum.", image_url: 'http://static.wixstatic.com/media/ce8a83_06f9d23429aa47b0a5d5f639edc22fcd.jpg_srz_195_195_85_22_0.50_1.20_0.00_jpg_srz', github_url: 'https://github.com/libsiumorisou', linkedin_url: 'https://linkedin.com/lipsiumoffendi', stackoverflow_url: 'https://stackoverflow.com/asdfadsfasdf')
  Student.create(first_name: "Warren", last_name: "Emptyer", cohort_id: 1, bio: "Lorem ipsum ad qui amet dolore, vitae cetero quaerendum mel ea. Facilis fastidii duo no. Viris partiendo ius no, alia animal nam at. Feugait imperdiet ius an, no quis facer lucilius vis. Aliquam saperet contentiones ex pro, id idque offendit ius. Fugit suavitate ad eam, ut essent debitis cum.", image_url: 'http://i.imgur.com/W1Kq7Yw.jpg', github_url: 'https://github.com/libsiumorisou', linkedin_url: 'https://linkedin.com/lipsiumoffendi')
  Student.create(first_name: "Mayra", last_name: "Garza", cohort_id: 1, bio: "Lorem ipsum ad qui amet dolore, vitae cetero quaerendum mel ea. Facilis fastidii duo no. Viris partiendo ius no, alia animal nam at. Feugait imperdiet ius an, no quis facer lucilius vis. Aliquam saperet contentiones ex pro, id idque offendit ius. Fugit suavitate ad eam, ut essent debitis cum.", image_url: 'http://acidcow.com/pics/20110608/cats_cats_21.jpg', github_url: 'https://github.com/libsiumorisou', stackoverflow_url: 'https://stackoverflow.com/asdfadsfasdf')
  Student.create(first_name: "Marshall", last_name: "Evans", cohort_id: 3, bio: "Lorem ipsum ad qui amet dolore, vitae cetero quaerendum mel ea. Facilis fastidii duo no. Viris partiendo ius no, alia animal nam at. Feugait imperdiet ius an, no quis facer lucilius vis. Aliquam saperet contentiones ex pro, id idque offendit ius. Fugit suavitate ad eam, ut essent debitis cum.", image_url: 'http://acidcow.com/pics/20110608/cats_cats_19.jpg', github_url: 'https://github.com/libsiumorisou', linkedin_url: 'https://linkedin.com/lipsiumoffendi')
  Student.create(first_name: "Pedro", last_name: "Marquez", cohort_id: 2, bio: "Lorem ipsum ad qui amet dolore, vitae cetero quaerendum mel ea. Facilis fastidii duo no. Viris partiendo ius no, alia animal nam at. Feugait imperdiet ius an, no quis facer lucilius vis. Aliquam saperet contentiones ex pro, id idque offendit ius. Fugit suavitate ad eam, ut essent debitis cum.", image_url: 'http://acidcow.com/pics/20110608/cats_cats_12.jpg', github_url: 'https://github.com/libsiumorisou', linkedin_url: 'https://linkedin.com/lipsiumoffendi', stackoverflow_url: 'https://stackoverflow.com/asdfadsfasdf')
  Student.create(first_name: "Chelsey", last_name: "Keller", cohort_id: 3, bio: "Lorem ipsum ad qui amet dolore, vitae cetero quaerendum mel ea. Facilis fastidii duo no. Viris partiendo ius no, alia animal nam at. Feugait imperdiet ius an, no quis facer lucilius vis. Aliquam saperet contentiones ex pro, id idque offendit ius. Fugit suavitate ad eam, ut essent debitis cum.", image_url: 'http://acidcow.com/pics/20110608/cats_cats_15.jpg', github_url: 'https://github.com/libsiumorisou', linkedin_url: 'https://linkedin.com/lipsiumoffendi', stackoverflow_url: 'https://stackoverflow.com/asdfadsfasdf')
  Student.create(first_name: "Bobby", last_name: "George", cohort_id: 2, bio: "Lorem ipsum ad qui amet dolore, vitae cetero quaerendum mel ea. Facilis fastidii duo no. Viris partiendo ius no, alia animal nam at. Feugait imperdiet ius an, no quis facer lucilius vis.", image_url: 'http://acidcow.com/pics/20110608/cats_cats_09.jpg', github_url: 'https://github.com/libsiumorisou', linkedin_url: 'https://linkedin.com/lipsiumoffendi', stackoverflow_url: 'https://stackoverflow.com/asdfadsfasdf')
  Student.create(first_name: "Jordan", last_name: "Krail", cohort_id: 3, bio: "Lorem ipsum ad qui amet dolore, vitae cetero quaerendum mel ea. Facilis fastidii duo no. Viris partiendo ius no, alia animal nam at. Feugait imperdiet ius an, no quis facer lucilius vis.", image_url: 'http://acidcow.com/pics/20110608/cats_cats_06.jpg', github_url: 'https://github.com/libsiumorisou', linkedin_url: 'https://linkedin.com/lipsiumoffendi')
  Student.create(first_name: "Will", last_name: "Draoi", cohort_id: 2, bio: "Lorem ipsum ad qui amet dolore, vitae cetero quaerendum mel ea. Facilis fastidii duo no. Viris partiendo ius no, alia animal nam at. Feugait imperdiet ius an, no quis facer lucilius vis.", image_url: 'http://acidcow.com/pics/20110608/cats_cats_03.jpg', github_url: 'https://github.com/libsiumorisou', linkedin_url: 'https://linkedin.com/lipsiumoffendi', stackoverflow_url: 'https://stackoverflow.com/asdfadsfasdf')
  Student.create(first_name: "Thomas", last_name: "Basrey", cohort_id: 3, bio: "Lorem ipsum ad qui amet dolore, vitae cetero quaerendum mel ea. Facilis fastidii duo no. Viris partiendo ius no, alia animal nam at. Feugait imperdiet ius an, no quis facer lucilius vis.", image_url: 'http://r.ddmcdn.com/w_622/u_0/gif/ep220-01-625x450.jpg', github_url: 'https://github.com/libsiumorisou')
  Student.create(first_name: "Megan", last_name: "Fasters", cohort_id: 3, bio: "Viris partiendo ius no, alia animal nam at. Feugait imperdiet ius an, no quis facer lucilius vis.", image_url: 'http://placekitten.com/200/300', github_url: 'https://github.com/libsiumorisou', stackoverflow_url: 'https://stackoverflow.com/asdfadsfasdf')
  Student.create(first_name: "Meril", last_name: "Lasrsw", cohort_id: 2, bio: "Viris partiendo ius no, alia animal nam at. Feugait imperdiet ius an, no quis facer lucilius vis.", image_url: 'http://placekitten.com/g/200/300', github_url: 'https://github.com/libsiumorisou', linkedin_url: 'https://linkedin.com/lipsiumoffendi', stackoverflow_url: 'https://stackoverflow.com/asdfadsfasdf')
  Student.create(first_name: "Tim", last_name: "Fally", cohort_id: 1, bio: "Viris partiendo ius no, alia animal nam at. Feugait imperdiet ius an, no quis facer lucilius vis.", image_url: 'http://static.ddmcdn.com/gif/02-kitten-cuteness-1.jpg', github_url: 'https://github.com/libsiumorisou', linkedin_url: 'https://linkedin.com/lipsiumoffendi', stackoverflow_url: 'https://stackoverflow.com/asdfadsfasdf')
end

if Visitor.all.size <= 0
  Visitor.create(first_name: 'Admin', last_name: 'Admin')
  admin = Visitor.find(1)
  admin.uuid = ENV['ADMIN_UUID']
  admin.save!
  Visitor.create(first_name: 'Buisness', last_name: 'Telly', email: 'test@gmail.com', cohort_id: 2)
end
