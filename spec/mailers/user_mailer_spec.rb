require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  let(:user) { FactoryBot.create(:user) }

  describe 'アカウント有効化のテスト' do
    let(:mail) { UserMailer.account_activation(user) }

    it 'メール送信先があっていること' do
      expect(mail.to).to eq ["tester4@example.com"]
      expect(mail.from).to eq ["noreply@example.com"]
    end
  end

  describe 'パスワードリセットのテスト' do
    let(:mail) { UserMailer.password_reset(user) }

    it 'メール送信先があっていること' do
      user.reset_token = User.new_token
      expect(mail.to).to eq ["tester5@example.com"]
      expect(mail.from).to eq ["noreply@example.com"]
    end
  end
end
