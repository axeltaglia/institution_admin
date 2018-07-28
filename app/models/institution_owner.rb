class InstitutionOwner < ApplicationRecord
  has_one :institution
  belongs_to :user, touch: true, autosave: true
  delegate :email, :email=, :name, :name=, to: :user
  
  validates :user_id, presence: true, uniqueness: true
end
