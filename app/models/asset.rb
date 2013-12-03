class Asset < ActiveRecord::Base

  mount_uploader :asset, AssetUploader

  ###
  # Validations
  ###

  validates_presence_of :asset

  ###
  # Callbacks
  ###

  before_save :update_content_type

  ###
  # Associations
  ###

  belongs_to :ticket

  private

  def update_content_type
    if asset.present? && asset_changed?
      self.content_type = asset.file.content_type
    end
  end

end
