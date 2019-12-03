require 'rails_helper'

RSpec.feature "Edit", type: :feature do
  let(:user) { FactoryBot.create(:user) }

  before do
    visit login_path
  end

  scenario 'ユーザーが編集に成功すること' do
    go_user_edit # support/login_support.rbに定義
    fill_in 'user[name]', with: 'ChangeUser'
    fill_in 'user[nickname]', with: 'ChangeNickname'
    fill_in 'user[email]', with: 'foobar@example.com'
    fill_in 'user[self_introduction]', with: 'ChangeIntroduction'
    click_button '更新する'
    expect(current_path).to eq user_path(user)
    expect(user.reload.name).to eq 'ChangeUser'
    expect(user.reload.nickname).to eq 'ChangeNickname'
    expect(user.reload.email).to eq 'foobar@example.com'
    expect(user.reload.self_introduction).to eq 'ChangeIntroduction'
  end

  scenario 'ユーザーが編集に成功しないこと' do
    go_user_edit # support/login_support.rbに定義
    fill_in 'user[name]', with: ' '
    fill_in 'user[nickname]', with: ' '
    fill_in 'user[email]', with: 'foobar@invalid'
    fill_in 'user[self_introduction]', with: ' '
    click_button '更新する'
    expect(current_path).to eq user_path(user)
    expect(user.reload.name).to_not eq ' '
    expect(user.reload.nickname).to_not eq ' '
    expect(user.reload.email).to_not eq 'foobar@invalid'
    expect(user.reload.self_introduction).to_not eq ' '
  end
end
