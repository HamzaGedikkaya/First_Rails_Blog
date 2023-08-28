class UsersController < ApplicationController
  before_action :require_admin, only: [:index, :edit, :update]

  def require_admin
    unless current_user && current_user.has_role?(:admin)
      flash[:alert] = "Bu sayfaya erişim izniniz yok."
      redirect_to root_path
    end
  end

  def index
    @users = User.order(created_at: :desc)
  end
  
  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to users_url, notice: "User was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end


  private
    def user_params
      params.require(:user).permit({role_ids: []})
    end
end
   