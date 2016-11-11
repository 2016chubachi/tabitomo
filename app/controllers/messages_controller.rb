class MessagesController < ApplicationController
  before_action :authenticate_member!

  # メッセージ一覧
  def index
    if params[:member_id]
      @member = Member.find(params[:member_id])
      @message = @member.message
    else
      @message = Message.all
    end
    @message = @message.readable_for(current_member)
      .order(created_at: :desc)

  end

  # メッセージ詳細
  def show
   @message = Message.find(params[:id])
  end

  # 新規メッセージフォーム
  def new
    @guide = Guide.find(params[:guide_id])
    @message = Message.new
    @message.receiver_id = @guide.id

  end

  # メッセージ編集フォーム
  def edit
    @message = Message.find(params[:id])
  end

  # 新規作成
  def create
    @message = Message.new(message_params)
    @message.sender = current_member
    if @message.save
      redirect_to  guide_detail_path(id: @message.receiver_id), notice: "メッセージを登録しました。"
    else
      redirect_to  new_message_path(guide_id: @message.receiver_id)

    end
  end

  # 更新
  def update
    @message = Message.find(params[:id])
    @message.assign_attributes(message_params)
    if @message.save
      redirect_to @message, notice: "メッセージを更新しました。"
    else
      render "edit"
    end
  end

  # 削除
  def destroy
    @message = Message.find(params[:id])
    @message.destroy
    redirect_to :messages
  end

  private
  def message_params
    params.require(:message).permit(:title, :content,
      :sender_id, :receiver_id)
  end


end
