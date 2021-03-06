class Cohort < ActiveRecord::Base
  MONTHS_TILL_EXPIRE = 3

  has_many :students, dependent: :destroy

  def within_range?
    today = Date.today
    months_distance = today.months_since(self.end_date.month).month - 1
    months_distance <= MONTHS_TILL_EXPIRE
  end

  def registered_students?
    self.students.registered.any?
  end
end
