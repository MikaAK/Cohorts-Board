module Students::StudentsHelper
  def resume_uploaded(student)
    student.resume? ? 'resume-added' : 'upload'
  end
end
