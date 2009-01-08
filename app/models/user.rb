class User < ActiveRecord::Base
  ROLES = %w(admin_0 admin_1 admin_2 partner_0 partner_1 partner_2).freeze

  acts_as_authentic
  acts_as_authorization_subject

  def role
    ROLES.detect { |role| self.has_role?(role) }
  end
end
