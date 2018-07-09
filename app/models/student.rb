class Student < ApplicationRecord
  belongs_to :user, touch: true
  belongs_to :institution

end
