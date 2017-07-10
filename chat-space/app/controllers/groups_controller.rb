class GroupsController < ApplicationController
  def index
    @groups = current_user.groups.includes(:messages)
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to group_messages_path(@group), notice: "グループが作成されました"
    else
      render :new
    end
  end

  def edit
    find_group
  end

  def update
    find_group
    if @group.update(group_params)
      redirect_to groups_path(params[:id]), notice: "グループが編集されました"
    else
      render :edit
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, user_ids: [])
  end

  def find_group
    @group = Group.find(params[:id])
  end
end
