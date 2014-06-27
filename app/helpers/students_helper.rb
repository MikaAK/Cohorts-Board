module StudentsHelper
  def canadian_cities
    [['Select a city', ''], ['----CANADA----', 'Canada'],'Kelowna', 'Whistler', 'Vancouver', 'Kamloops',
    'Victoria', 'Nanaimo', 'Calgary',
    'Edmonton', 'Saskatoon', 'Regina',
    'Winnipeg', 'Hamilton', 'London',
    'Guelph', 'Kingston', 'Ottawa',
    'Toronto', 'Montreal', 'Halifax',
    'Quebec City', 'St-Johns', 'Charlottetown',
    'Moncton', 'Fredricton', 'Yellow Knife',
    'Iqualit', 'White Horse']
  end

  def american_cities
    [['-----USA-----', 'USA'],'Seattle', 'Portland', 'San Francisco',
    'San Diego', 'San Jose', 'Los Angeles',
    'Sacramento', 'Oakland', 'New York City',
    'Las Vegas', 'Phoenix', 'Houston',
    'Dallas', 'Atlanta', 'Oklahoma City',
    'Denver', 'Boise', 'Billings',
    'Albuquerque', 'Wichita', 'Little Rock',
    'Nashville', 'Jackson', 'Burmingham',
    'Jacksonville', 'Miami', 'Orlando',
    'Tampa Bay', 'St Louis', 'Kansas',
    'Des Moines', 'Davenport', 'Salt Lake City',
    'Chicago', 'Minneapolis', 'Detroit',
    'Cleveland', 'Columbus', 'Cincinnati',
    'Indianapolis', 'Boston', 'Washington',
    'Philadelphia', 'Baltimore', 'Pittsburgh',
    'Lexington', 'Knoxville', 'Kansas City',
    'Milwaukee', 'Burlington', 'Manchester']
  end

  def resume_uploaded(student)
    student.resume.present? ? 'resume-added' : 'upload'
  end
end
