class User < ActiveRecord::Base

  include Tokenable

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

  private

  def ensure_authentication_token
    @token = generate_token
    self.authentication_token = @token
  end

  def valid_token?(token)
    self.authentication_token == token
  end

end
