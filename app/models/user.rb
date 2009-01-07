class User < ActiveRecord::Base
  acts_as_authentic

  attr_protected :role
  validates_presence_of :role
end
