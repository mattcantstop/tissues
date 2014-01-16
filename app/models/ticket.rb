class Ticket < ActiveRecord::Base

  attr_accessible :description, :title, :assets_attributes, :tag_names

  ###
  # Validations
  ###
  validates_presence_of :title, :description
  validates :description, length: { minimum: 10 }

  ###
  # Associations
  ###

  belongs_to :project
  belongs_to :state
  belongs_to :user
  has_many :assets
  has_many :tags
  accepts_nested_attributes_for :assets
  has_many :comments


end
