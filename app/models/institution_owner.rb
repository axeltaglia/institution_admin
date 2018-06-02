class InstitutionOwner < ApplicationRecord
  belongs_to :user, touch: true
  
  validates :user_id, presence: true, uniqueness: true
end
