module Admin::CohortsHelper
  def student_registered(student)
    student.registered ? 'Yes' : 'No'
  end
end
