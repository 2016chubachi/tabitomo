class MessageReceivesController < ApplicationController
  # 受信メッセージ

  def index
    @receives = Message.find(:receiver_id => current_member,:select => "receiver_id, sender_id").uniq
  end
end
