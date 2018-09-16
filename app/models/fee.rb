class Fee < ApplicationRecord
  belongs_to :student
  has_many :items

  enum status: [:pending, :payed, :partially_paid, :cancelled]
end
