class Admin::UsersController < ApplicationController

  before_action :admin?

  def index
    @users = User.normal_user.page(params[:page]).per(30)
  end

  def edit
    @user = User.find(get_user)
  end

  def update
    @user = User.find(get_user)
    if params[:user][:password].blank?
      if @user.update_without_password(user_detail)
        flash[:success] = "Update user successfully."
        redirect_to admin_users_path
      end
    elsif @user.update(user_detail)
      flash[:success] = "Update user successfully."
      redirect_to admin_users_path
    else
      flash[:danger] = @user.errors.full_messages[0]
      redirect_to edit_admin_user_path(@user.id)
    end

  end

  def destroy
    User.find(get_user).destroy
    redirect_to admin_users_path
  end

  protected
  def admin?
    if !current_user.admin
      redirect_to authenticated_root_path
    end
  end

  private
  def get_user
    params.require(:id)
  end

  def user_detail
    params.require(:user).permit(:firstname, :lastname, :active, :password)
  end

end
