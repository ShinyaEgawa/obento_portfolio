class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "新規登録が完了しました!"
      redirect_to @user
    else
      render 'new'
    end
  end

private
    def user_params
      params.require(:user).permit(:name, :nickname, :email, :self_introduction,
                                   :password, :password_confirmation)
    end
end