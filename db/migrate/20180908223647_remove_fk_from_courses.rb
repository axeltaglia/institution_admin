class RemoveFkFromCourses < ActiveRecord::Migration[5.0]
  def change
  	remove_reference :courses, :schedule, index: true
  	remove_reference :courses, :classroom, index: true
  end
end
