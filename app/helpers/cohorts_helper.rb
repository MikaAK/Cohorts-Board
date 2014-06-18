module CohortsHelper
  def named_date time
    time.to_date.strftime "%B"
  end
end
