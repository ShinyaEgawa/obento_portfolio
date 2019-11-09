require 'rails_helper'

RSpec.feature "Login", type: :feature do
  let(:user) { FactoryBot.create(:user) }

  before do
    visit login_path
  end

  scenario 'ログイン・ログアウトが成功すること' do
    # ログインのテスト
    fill_in('session[email]', with: user.email)
    fill_in('session[password]', with: user.password)
    click_button 'ログイン'
    expect(current_path).to eq user_path(user)
    expect(page).to_not have_link 'ログイン'
    # ログアウトのテスト
    click_link 'ログアウト'
    expect(current_path).to eq root_path
    expect(page).to_not have_link 'ログアウト'
  end

  scenario '新規登録リンクが表示されていること' do
    expect(page).to have_link '新規登録はこちら'
  end

  scenario 'タイトル名がログイン - サイト名となっていること' do
    expect(page).to have_title full_title('ログイン')
  end
end
