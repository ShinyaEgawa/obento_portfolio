require 'rails_helper'

RSpec.describe 'Remember me', type: :request do
  let(:user) { FactoryBot.create(:user) }

  context 'バグ回避のテスト' do
    it 'ログイン中のみログアウトが行えること' do
      # ログインを行う
      sign_in_as(user)
      expect(response).to redirect_to user_path(user)
      # ログアウトを行う
      delete logout_path
      expect(response).to redirect_to root_path
      expect(session[:user_id]).to eq nil
      # 他のウィンドウでログアウトを行う
      delete logout_path
      expect(response).to redirect_to root_path
      expect(session[:user_id]).to eq nil
    end
  end
end
