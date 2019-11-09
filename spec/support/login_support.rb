# ログイン用メソッド
module LoginSupport
  def valid_login(user)
    fill_in('session[email]', with: user.email)
    fill_in('session[password]', with: user.password)
    click_button 'ログイン'
  end

  def go_user_edit
    valid_login(user)
    visit user_path(user)
    click_link '更新'
  end
end

# LoginSupportモジュールをincludeする
RSpec.configure do |config|
  config.include LoginSupport
end
