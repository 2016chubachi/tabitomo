class MessagesController < ApplicationController
  before_action :authenticate_member!

  # # メッセージ一覧
  # def index
  #   if params[:member_id]
  #     @member = Member.find(params[:member_id])
  #     @message = @member.message
  #   else
  #     @message = Message.all
  #   end
  #   @message = @message.readable_for(current_member)
  #     .order(created_at: :desc)

  # end

  # # メッセージ詳細
  # def show
  # @message = Message.find(params[:id])
  # end

  # # 新規メッセージフォーム
  # def new
  #   @guide = Guide.find(params[:guide_id])
  #   @message = Message.new
  #   @message.receiver_id = @guide.id

  # end

  # # メッセージ編集フォーム
  # def edit
  #   @message = Message.find(params[:id])
  # end

  # # 新規作成
  # def create
  #   @message = Message.new(message_params)
  #   @message.sender = current_member
  #   if @message.save
  #     redirect_to  guide_detail_path(id: @message.receiver_id), notice: "メッセージを登録しました。"
  #   else
  #     redirect_to  new_message_path(guide_id: @message.receiver_id)

  #   end
  # end

  # # 更新
  # def update
  #   @message = Message.find(params[:id])
  #   @message.assign_attributes(message_params)
  #   if @message.save
  #     redirect_to @message, notice: "メッセージを更新しました。"
  #   else
  #     render "edit"
  #   end
  # end

  # # 削除
  # def destroy
  #   @message = Message.find(params[:id])
  #   @message.destroy
  #   redirect_to :messages
  # end

  # private
  # def message_params
  #   params.require(:message).permit(:title, :content,
  #     :sender_id, :receiver_id)
  # end
  
  # 返信
  def new
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
