class Student < ApplicationRecord
  belongs_to :user, touch: true, dependent: :destroy
  belongs_to :institution

  has_many :subscriptions
  accepts_nested_attributes_for :subscriptions, :allow_destroy => true

  has_many :contact_informations
  accepts_nested_attributes_for :contact_informations, :allow_destroy => true

  has_many :fees

  def full_name
    "#{self.name} #{self.last_name}"
  end

end
