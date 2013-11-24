class Project < ActiveRecord::Base

  ###
  # Validations
  ###

  validates :name, presence: true
  
  ###
  # Associations
  ###

  has_many :tickets, dependent: :delete_all
  has_many :permissions, as: :thing

  ###
  # Scopes
  ###

  scope :viewable_by, ->(user) do
    joins(:permissions).where(permissions: { action: "view",
                                             user_id: user.id })
  end

end
