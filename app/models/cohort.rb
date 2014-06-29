class Cohort < ActiveRecord::Base
  has_many :students

  def within_range?
    today = Date.today
    binding.pry
    months_ago = today.months_since(self.end_date)

  end
end
