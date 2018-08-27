class Course < ApplicationRecord
  belongs_to :asignature
  belongs_to :schedule
  belongs_to :classroom
  belongs_to :institution

  enum charging_mode: [:monthly, :per_class]
  enum frecuency: [:weekly, :twice_a_week, :once_every_2_weeks, :once_a_month]


end
