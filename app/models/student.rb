class Student < ApplicationRecord
  belongs_to :user, touch: true, dependent: :destroy
  belongs_to :institution

  def full_name
    "#{self.name} #{self.last_name}"
  end

end
