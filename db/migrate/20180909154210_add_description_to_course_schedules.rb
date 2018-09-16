class AddDescriptionToCourseSchedules < ActiveRecord::Migration[5.0]
  def change
    add_column :course_schedules, :description, :string
  end
end
