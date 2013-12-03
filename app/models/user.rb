class User < ActiveRecord::Base

  has_secure_password
  has_many :permissions
  has_many :tickets

  ###
  # Validations
  ###

  validates_presence_of :email

  def to_s
    "#{email} (#{admin? ? "Admin" : "User"})"
  end

end
