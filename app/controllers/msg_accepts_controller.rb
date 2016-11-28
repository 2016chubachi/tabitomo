class MsgAcceptsController < ApplicationController
  before_action :authenticate_member!
  
  # 受信メッセージ
  def index
    @accepts = Message.where(:receiver_id => current_member).pluck(:receiver_id, :sender_id).uniq
    unless @accepts.present?
      flash.now[:notice] = "受信したメッセージありません！"
    end
  end
end
