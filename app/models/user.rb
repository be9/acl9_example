class User < ActiveRecord::Base
  acts_as_authentic

  attr_protected :role
  validates_presence_of :role

  def has_role?(role_name, object=nil)
    self.role == role_name.to_s
  end

  def has_role!(role_name)
    self.role = role_name.to_s
    save!
  end
end
