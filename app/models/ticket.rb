class Ticket < ActiveRecord::Base

  validates_presence_of :title, :description
  validates :description, length: { minimum: 10 }

  belongs_to :project


end
