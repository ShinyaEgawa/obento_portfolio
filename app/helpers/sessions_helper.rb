module SessionsHelper
  #cookieで渡されたユーザーでのログイン
  def log_in(user)
    session[:user_id] = user.id
  end
  #ログイン中である場合
  #session :user_idに情報があれば @current_userに値が入るはずなので
  #その次の logged_in? でfalseが返ってくることはないはず
  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end
  #ログインしていればtrue、それ以外はfalseを返す
  def logged_in?
    !current_user.nil?
  end
  #ユーザーのログアウト
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
end
