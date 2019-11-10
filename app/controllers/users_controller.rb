class UsersController < ApplicationController
  before_action :logged_in_user, only: %i[index edit update destroy]
  before_action :correct_user, only: %i[edit update]
  before_action :admin_user, only: %i[destroy]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @user.send_activation_email
      flash[:info] = "アカウント有効化メールをお送りしました！"
      redirect_to root_url
      # log_in @user
      # flash[:success] = "新規登録が完了しました!"
      # redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "ユーザーの更新に成功しました"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "ユーザーの削除に成功しました"
    redirect_to users_url
  end

  private

  def user_params
    params.require(:user).permit(:name, :nickname, :email, :self_introduction,
                                 :password, :password_confirmation)
  end

  # ログイン済みのユーザーかどうかのチェック
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "ログインを行なってください"
      redirect_to login_url
    end
  end

  # 正しいユーザーかどうかのチェック
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end

  # 管理者かどうかのチェック
  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end
end
