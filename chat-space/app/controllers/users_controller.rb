class UsersController < ApplicationController
  def edit
  end

  def update
    user = User.find(params[:id])
    user.update(params_edit) if user.id == current_user.id
  end

  private
  def params_edit
    params.require(:user).permit(:name,:email)
  end
end
