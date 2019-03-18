class Institution < ApplicationRecord
  has_many :institution_owners
  has_many :students, dependent: :delete_all
  
  validates :name, presence: true
end
