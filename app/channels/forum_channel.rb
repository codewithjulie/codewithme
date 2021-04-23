class ForumChannel < ApplicationCable::Channel
  def subscribed
    stream_from "forum_channel_#{params[:forum_id]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
