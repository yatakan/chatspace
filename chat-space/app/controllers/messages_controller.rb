class MessagesController < ApplicationController
  def index
    @groups = current_user.groups
    @group = Group.find(params[:group_id])
    @message = Message.new
  end

  def create
    @message = Message.new(create_params)
    if @message.save
      redirect_to group_messages_path(params[:group_id])
    else
      redirect_to group_messages_path(params[:group_id]), alert: "テキストが入力されていません"
    end
  end

  private
  def create_params
    params.require(:message).permit(:text, :image).merge(group_id: params[:group_id], user_id: current_user.id)
  end
end
