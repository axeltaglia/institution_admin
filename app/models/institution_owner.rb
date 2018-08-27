class InstitutionOwner < ApplicationRecord
  has_one :institution
  belongs_to :user, touch: true, autosave: true
  
  validates :user_id, presence: true, uniqueness: true
end
