class Ticket < ActiveRecord::Base

  ###
  # Validations
  ###
  validates_presence_of :title, :description
  validates :description, length: { minimum: 10 }

  ###
  # CarrierWave Support
  ###

  mount_uploader :asset, AssetUploader

  ###
  # Associations
  ###

  belongs_to :project
  belongs_to :user


end
