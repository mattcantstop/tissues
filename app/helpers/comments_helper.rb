module CommentsHelper

  def state_for(comment)
    return "#{comment.previous_state} \&rarr; #{comment.state}"
  end

end
