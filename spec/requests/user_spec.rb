require 'rails_helper'

RSpec.describe "User pages", type: :request do
  let(:user) { FactoryBot.create(:user) }

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

    context 'アカウントが違うユーザーの場合' do
      before do
        @other_user = FactoryBot.create(:user)
      end
    end
  end

  describe 'GET #edit' do
    context 'ログイン済みのユーザーの場合' do
      it '正常なレスポンスを返すこと' do
        sign_in_as user
        get edit_user_path(user)
        expect(response).to be_successful
        expect(response).to have_http_status "200"
      end
    end

    context 'ログインしていないユーザーが編集を行う場合' do
      it 'ログイン画面へリダイレクトすること' do
        get edit_user_path(user)
        expect(response).to redirect_to login_path
      end
    end

    context 'アカウントが違うユーザの場合' do
      before do
        @other_user = FactoryBot.create(:user)
      end

      it 'ホーム画面へリダイレクトすること' do
        sign_in_as @other_user
        get edit_user_path(user)
        expect(response).to redirect_to root_path
      end
    end
  end
end
