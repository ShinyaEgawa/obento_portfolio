require 'rails_helper'

RSpec.describe "User pages", type: :request do
  let(:user) { FactoryBot.create(:user) }
  let(:other_user) { FactoryBot.create(:user) }
  let(:user_params) { FactoryBot.attributes_for(:user, name: "NewName") }
  let(:update_user) { patch user_path(user), params: { id: user.id, user: user_params } }

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
        expect(response).to have_http_status "302"
        expect(response).to redirect_to login_path
      end
    end

    context 'アカウントが違うユーザの場合' do
      it 'ホーム画面へリダイレクトすること' do
        sign_in_as other_user
        get edit_user_path(user)
        expect(response).to redirect_to root_path
      end
    end
  end

  describe 'GET #update' do
    context 'ログイン済みの認証ユーザーとして' do
      it 'ユーザーを更新できること' do
        sign_in_as user
        update_user
        expect(user.reload.name).to eq "NewName"
      end
    end

    context 'ログインしていないユーザーとして' do
      it 'ユーザーを更新することなく、ログイン画面へリダイレクトすること' do
        update_user
        expect(response).to have_http_status "302"
        expect(response).to redirect_to login_path
      end
    end

    context 'アカウントが違うログイン済みユーザーとして' do
      it '他のユーザーを更新できないこと' do
        sign_in_as other_user
        update_user
        expect(user.reload.name).to eq other_user.name
      end

      it 'ホーム画面へリダイレクトすること' do
        sign_in_as other_user
        update_user
        expect(response).to redirect_to root_path
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'adminとして' do
      it '自身は削除できないこと' do
        sign_in_as user
        expect { # rubocop:disable Style/BlockDelimiters
          delete user_path(user), params: { id: user.id }
        }.to change(User, :count).by(0)
      end
    end

    context 'ログインしていないユーザーとして' do
      it '正常なレスポンスを返すこと' do
        delete user_path(user), params: { id: user.id }
        expect(response).to have_http_status "302"
      end

      it 'ログイン画面へリダイレクトすること' do
        delete user_path(user), params: { id: user.id }
        expect(response).to redirect_to login_path
      end
    end

    context 'アカウントが違うログイン済みユーザとして' do
      it 'ホーム画面へリダイレクトすること' do
        sign_in_as other_user
        delete user_path(user), params: { id: user.id }
        expect(response).to redirect_to root_path
      end
    end
  end
end
