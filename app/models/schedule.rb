class Schedule < ApplicationRecord
  belongs_to :day
  belongs_to :hour

  scope :by_day_and_hour, -> (day_str, hour_str) { joins(:day, :hour).where("days.name = '" + day_str + "' and hours.str_time = '" + hour_str + "'").first }
 

  def full_schedule
  	self.day.name + ", " + self.hour.str_time
  end
end
