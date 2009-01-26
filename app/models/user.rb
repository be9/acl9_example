class User < ActiveRecord::Base
  ROLES = %w(admin_0 admin_1 admin_2 partner_0 partner_1 partner_2).freeze

  belongs_to :creator, :class_name => "User"
  attr_protected :creator

  acts_as_authentic
  acts_as_authorization_subject

  def role
    ROLES.detect { |role| self.has_role?(role) }
  end

  def admin?
    !!(role =~ /admin/)
  end

  def partner?
    !!(role =~ /partner/)
  end
end
