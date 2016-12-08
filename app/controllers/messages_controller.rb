class MessagesController < ApplicationController
  before_action :authenticate_member!

  # 返信
  def new
    if params[:source].present? && !current_member.traveler.present?
      # ガイド詳細ページからのメッセージはトラベラーしかできない
      flash[:notice] = "貴方のいるユーザーグループでは、該当する権限が有りません！"
      redirect_to guide_detail_path(params[:guide_id])
    else
      if params[:target].present? || params[:guide_id].present?
        # 新規メッセージの観点から自分が送信者、ターゲットが受信者になる
        msg_rel_member = {receiver: params[:target]||params[:guide_id] , sender: current_member.id}
        @new_msg = Message.new
        @new_msg.receiver_id = msg_rel_member[:receiver]
        @new_msg.sender_id = msg_rel_member[:sender]
        @messages = Message.where("(receiver_id = ? and sender_id = ?) or (receiver_id = ? and sender_id = ?)",
                                msg_rel_member[:receiver],
                                msg_rel_member[:sender],
                                msg_rel_member[:sender],
                                msg_rel_member[:receiver]).order(updated_at: :DESC)
      else
        raise "不正なアクセス！"
      end
    end
  end
  
  # db更新
  def create
    @new_msg = Message.new(message_params)
    if @new_msg.save
      flash.now[:notice] = "メッセージを送信しました。"
      redirect_to msg_sends_path
    else
      # エラー情報を遷移先に渡す
      session[:errors] = @new_msg.errors.full_messages
      # メッセージ送信ページに遷移
      redirect_to new_message_path(target: @new_msg.receiver_id)
    end
  end

 private
  def message_params
    attrs = [:title, :content,:receiver_id,:sender_id]
    params.require(:message).permit(attrs)
  end
end
