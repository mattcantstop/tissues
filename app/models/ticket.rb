class Ticket < ActiveRecord::Base

  attr_accessor :tag_names

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
  accepts_nested_attributes_for :assets
  has_many :comments
  has_and_belongs_to_many :tags


end
