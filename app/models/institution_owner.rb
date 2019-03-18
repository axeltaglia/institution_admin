class InstitutionOwner < ApplicationRecord
  belongs_to :institution
  has_one :user
end
