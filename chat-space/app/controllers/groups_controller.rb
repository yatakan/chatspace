class GroupsController < ApplicationController
  def index
    @groups = current_user.groups
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(create_params)
    if @group.save
      redirect_to messages_path, notice: "グループが作成されました"
    else
      render :new
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    if @group.update(create_params)
      redirect_to messages_path, notice: "グループが編集されました"
    else
      render :edit
    end
  end

  private

  def create_params
    params.require(:group).permit(:name, user_ids: [])
  end
end
