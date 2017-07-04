class MessagesController < ApplicationController
  before_action :current_user_groups, only: [:index, :create]
  def index
    @message = Message.new
  end

  def create
    @message = Message.new(create_params)
    if @message.save
      redirect_to group_messages_path(params[:group_id])
    else
      flash.now[:alert] = "テキストが入力されていません"
      render :index
    end
  end

  private
  def create_params
    params.require(:message).permit(:text, :image).merge(group_id: params[:group_id], user_id: current_user.id)
  end

  def current_user_groups
    @group = Group.find(params[:group_id])
    @groups = current_user.groups.includes([:messages,:users])
    @messages = @group.messages.includes(:user)
  end
end
