class Student < ApplicationRecord
  has_one :user
  belongs_to :institution

  has_many :subscriptions
  accepts_nested_attributes_for :subscriptions, :allow_destroy => true

  has_many :contact_informations
  accepts_nested_attributes_for :contact_informations, :allow_destroy => true

  has_many :fees

  scope :actives, -> { where(status: 1) }

  def full_name
    "#{self.name} #{self.last_name}"
  end

  def pay_pending?
    self.fees.where('fees.status = 0').count > 0
  end

end
