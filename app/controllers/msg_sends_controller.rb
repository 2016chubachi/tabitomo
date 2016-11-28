class MsgSendsController < ApplicationController
  before_action :authenticate_member!
  
  # 送信メッセージ
  def index
    @sends = Message.where(:sender_id => current_member).pluck(:receiver_id, :sender_id).uniq
    unless @sends.present?
      flash.now[:notice] = "送信したメッセージありません！"
    end
  end
end
