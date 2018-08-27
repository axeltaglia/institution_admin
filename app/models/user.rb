class User < ApplicationRecord
  ROLES = %w[admin institution_owner secretary teacher student student_tutor].freeze

  has_one :institution_owner
  has_one :student


  validates :name, presence: true
  validates :email, uniqueness: true, email: true

  def roles=(roles)
    self.roles_mask = (roles & ROLES).map { |r| 2**ROLES.index(r) }.inject(0, :+)
  end
  
  def roles
    ROLES.reject do |r|
      ((roles_mask.to_i || 0) & 2**ROLES.index(r)).zero?
    end
  end

  def is?(role)
    roles.include?(role.to_s)
  end

  def admin!
    self.roles = ['admin']
  end

  def institution_owner!
    self.roles = ['institution_owner']
  end

  def student!
    self.roles = ['student']
  end

  # Include default devise modules. Others available are:
  # :registerable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable, :validatable
end
