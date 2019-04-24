class Subscription < ApplicationRecord
  belongs_to :student
  belongs_to :asignature, required: true
  belongs_to :day, required: true
  belongs_to :start_at, foreign_key: "start_at_id", class_name: "Hour", required: true
  belongs_to :end_at, foreign_key: "end_at_id", class_name: "Hour", required: true
  belongs_to :classroom, required: true

  enum charging_mode: [:monthly, :per_class]
  
  scope :actives, -> { where(status: 1) }

  def description
    self.asignature.name + " | " + self.day.name + " de " + self.start_at.str_time + " a " + self.end_at.str_time 
  end

end
