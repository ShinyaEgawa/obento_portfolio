require 'rails_helper'

RSpec.describe "User pages", type: :request do
  let!(:user) { FactoryBot.create(:user) }

  describe 'GET #new' do
    it '正常なレスポンスを返すこと' do
      get signup_path
      expect(response).to be_successful
      expect(response).to have_http_status "200"
    end
  end

  describe 'GET #show' do
    context 'ログイン済みのユーザーの場合' do
      it '正常なレスポンスを返すこと' do
        sign_in_as user
        get user_path(user)
        expect(response).to be_successful
        expect(response).to have_http_status "200"
      end
    end

=begin
    context 'ログインしていないユーザーの場合' do
      it 'ログイン画面に移行すること' do
        get user_path(user)
        expect(response).to redirect_to login_path
      end
    end
=end
  end
end
