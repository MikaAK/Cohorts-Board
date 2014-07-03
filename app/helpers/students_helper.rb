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

  def format_date(date)
    date.strftime '%B %e, %Y'
  end

  def avatar_image(student)
    student.avatar? ? student.avatar.url : student.avatar.default_url
  end

  def github_url(url)
    if url =~ /^https?:\/\/(www.)?github.com/
      url
    else
      url.prepend 'https://github.com/'
    end
  end

  def linkedin_url(url)
    if url =~ /^https?:\/\//
      url
    else
      url.prepend 'https://linkedin.com/in/'
    end
  end
end
