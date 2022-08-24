class UsersController < ApplicationController
  def create
    user_params = params.require(:user).permit(:name, :nickname, :email, :password)
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id

      redirect_to  root_path, notice: "Вы успешно зарегистрировались"
    else
      render :new
    end
  end

  def new
    @user = User.new
  end
end
