class User < ActiveRecord::Base

  has_secure_password
  has_many :permissions
  has_many :tickets

  ###
  # Callbacks
  ###

  before_save :ensure_authentication_token

  ###
  # Validations
  ###

  validates_presence_of :email

  def to_s
    "#{email} (#{admin? ? "Admin" : "User"})"
  end

end
