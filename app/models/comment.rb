class Comment < ActiveRecord::Base

  after_create :set_ticket_state

  belongs_to :ticket
  belongs_to :user
  belongs_to :state

  validates :text, :presence => true

  def set_ticket_state

  end

end
