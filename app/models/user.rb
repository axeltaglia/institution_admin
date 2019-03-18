class User < ApplicationRecord
  ROLES = %w[admin institution_owner secretary teacher student student_tutor].freeze

  belongs_to :institution_owner
  belongs_to :student
  #belongs_to :teacher
  #belongs_to :secretary
  #belongs_to :student_tutor

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
    self.roles = self.roles + ['admin']
  end

  def institution_owner!(institution)
    self.roles = self.roles + ['institution_owner']
    self.institution_owner = InstitutionOwner.create!(institution_id: institution.id)
  end

  def student!
    self.roles = self.roles + ['student']
  end

  # Include default devise modules. Others available are:
  # :registerable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable, :validatable
end
