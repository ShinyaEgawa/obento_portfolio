class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      if user.activated?
        log_in user
        params[:session][:remember_me] == '1' ? remember(user) : forget(user)
        redirect_back_or user
      else
        message = 'アカウントが有効ではありません。'
        message += '登録されたメールアドレスに有効化メールを送付していますのでご確認ください。'
        flash[:warning] = message
        redirect_to root_url
      end
    else
      flash.now[:danger] = 'メールアドレスまたはパスワードが間違っています'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

  def guest_login
    user = User.find(1)
    log_in(user)
    flash[:success] = 'ゲストユーザーでログインを行っております'
    redirect_to root_url
  end
end
