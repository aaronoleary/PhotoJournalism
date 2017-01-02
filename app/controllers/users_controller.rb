class UsersController < ApplicationController
  before_filter :authenticate_user!
  def show
    @user = user.find(params[:id])
    @posts = user.posts
  end
  def edit
    @user = current_user.id
  end
  def update
    @user = User.find(current_user.id)
    if @user.update(user_params)
      bypass_sign_in (@user)
      redirect_to root_path
    else
      render'edit'
    end
  end
  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
