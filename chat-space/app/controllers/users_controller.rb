class UsersController < ApplicationController

  def index
    @users = User.where('name LIKE(?)',"%#{params[:keyword]}%")
    respond_to do |format|
      format.json
    end
  end

  def edit
  end

  def update
    user = User.find(params[:id])
    if user.update(params_edit)
      redirect_to groups_path, notice: "ユーザー情報が編集されました。"
    else
      render :edit
    end
  end

  private
  def params_edit
    params.require(:user).permit(:name,:email)
  end
end
