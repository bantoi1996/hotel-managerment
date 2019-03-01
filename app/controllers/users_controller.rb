class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new user_params

    if @user.save
      log_in @user
      flash[:success] = t "welcome"
      redirect_to @user
    else
      flash[:danger] = t "error_signup"
      render :new
    end
  end

  def show
    @user = User.find_by(id: params[:id])

    return redirect_to root_path if @user
    flash[:danger] = t "error_find_user"
    redirect_to signup_path
  end

  private

  def user_params
    params.require(:user).permit :fullname, :address, :telephone, :email,
     :password, :password_confirmation
  end
end
