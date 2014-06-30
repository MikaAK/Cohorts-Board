module ApplicationHelper
  def full_name(student)
    if student.last_name?
      student.first_name + " " + student.last_name
    else
      student.first_name
    end
  end

  def home_path
    if request.path != '/students/profile'
      path = request.path.split('/').second
      path.present? ? '/' + path : '/'
    end
  end
end
