class GroupsController < ApplicationController
  def new
    @group = Group.new
  end

  def create
    @group = Group.new(params_permit)
    if @group.save
      flash[:notice] = "グループが作成されました。"
      redirect_to messages_path
    else
      render 'new'
    end
    # reirect と renderのちがい
  end

  def edit
  end

  def update
  end

  private
  def params_permit
    params.require(:group).permit(:name, user_ids: [])
  end
end
