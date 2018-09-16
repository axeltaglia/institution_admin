class CourseSchedule < ApplicationRecord
  belongs_to :course
  belongs_to :day
  belongs_to :start_at, class_name: "Hour"
  belongs_to :end_at, class_name: "Hour"
  belongs_to :classroom
end
