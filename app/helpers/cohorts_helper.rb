module CohortsHelper
  def month date
    date.to_date.strftime "%B"
  end
end
