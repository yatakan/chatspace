class UsersController < ApplicationController
  def edit
  end

  def update
    user = User.find(params[:id])
    input = User.new(params_edit)
    if(user.id == current_user.id && user.name != input.name || user.email != input.email)
      user.update(params_edit)
      redirect_to groups_path, notice: "ユーザー情報が編集されました。"
    else
      redirect_to groups_path, notice: "ユーザー情報はそのままです。"
    end
  end

  private
  def params_edit
    params.require(:user).permit(:name,:email)
  end
end
