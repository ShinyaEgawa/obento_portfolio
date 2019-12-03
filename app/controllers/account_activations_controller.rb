class AccountActivationsController < ApplicationController
  def edit
    user = User.find_by(email: params[:email])
    if user && !user.activate? && user.authenticated?(:activation, params[:id])
      user.activate
      log_in user
      flash[:success] = 'アカウントの有効化に成功しました！'
      redirect_to user
    else
      flash[:danger] = 'リンクが無効です'
      redirect_to root_url
    end
  end
end
