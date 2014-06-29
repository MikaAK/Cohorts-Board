module ApplicationHelper
  def full_name(student)
    student.first_name + " " + student.last_name
  end

  def home_path
    if request.path != '/students/profile'
      path = request.path.split('/').second
      path.present? ? '/' + path : '/'
    end
  end
end
