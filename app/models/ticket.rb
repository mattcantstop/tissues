class Ticket < ActiveRecord::Base

  ###
  # Validations
  ###
  validates_presence_of :title, :description
  validates :description, length: { minimum: 10 }

  ###
  # Associations
  ###

  belongs_to :project
  belongs_to :user
  has_many :assets
  accepts_nested_attributes_for :assets
  has_many :comments
  belongs_to :state


end
