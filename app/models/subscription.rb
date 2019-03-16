class Subscription < ApplicationRecord
  belongs_to :student
  belongs_to :asignature
  has_many :schedules
  
  accepts_nested_attributes_for :schedules, :allow_destroy => true

  enum charging_mode: [:monthly, :per_class]
  enum frecuency: [:weekly, :twice_a_week, :once_every_2_weeks, :once_a_month]


  #def complete_schedule
  #	arr = []
  #  self.course_schedules.each do |course_schedule|
  #	  arr << course_schedule.day.name + " " + course_schedule.start_at.str_time + "-" + course_schedule.end_at.str_time + " (#{course_schedule.classroom.name})"
  #	end
  # 	arr.join(", ")
  #end

  def description
    self.asignature.name + " | "
  end

end
