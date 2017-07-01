class GroupsController < ApplicationController
  def new
    @group = Group.new
  end

  def create
    @group = Group.new(create_permit)
    if @group.save
      redirect_to messages_path,notice: "グループが作成されました"
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  private

  def create_permit
    params.require(:group).permit(:name, user_ids: [])
  end
end
