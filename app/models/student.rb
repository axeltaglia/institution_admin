class Student < ApplicationRecord
  belongs_to :user, touch: true, dependent: :destroy
  belongs_to :institution

end
