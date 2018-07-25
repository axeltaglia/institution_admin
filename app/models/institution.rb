class Institution < ApplicationRecord
  belongs_to :institution_owner

  validates :name, presence: true
  validates :institution_owner, presence: true
end
