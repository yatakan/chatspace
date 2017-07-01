class GroupsController < ApplicationController
  def index
    @groups = current_user.groups
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(create_or_update_params)
    if @group.save
      redirect_to messages_path, notice: "グループが作成されました"
    else
      render :new
    end
  end

  def edit
    find_group
  end

  def update
    find_group
    if @group.update(create_or_update_params)
      redirect_to messages_path, notice: "グループが編集されました"
    else
      render :edit
    end
  end

  private

  def create_or_update_params
    params.require(:group).permit(:name, user_ids: [])
  end

  def find_group
    @group = Group.find(params[:id])
  end
end
