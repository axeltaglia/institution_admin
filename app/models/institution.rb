class Institution < ApplicationRecord
  belongs_to :institution_owner
  has_many :students, dependent: :delete_all
  
  validates :name, presence: true
  validates :institution_owner, presence: true
end
