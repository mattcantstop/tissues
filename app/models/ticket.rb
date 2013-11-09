class Ticket < ActiveRecord::Base

  validates_presence_of :title, :description

  belongs_to :project


end
