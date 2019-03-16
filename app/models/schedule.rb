class Schedule < ApplicationRecord
  belongs_to :subscription
  belongs_to :day
  belongs_to :classroom
end
