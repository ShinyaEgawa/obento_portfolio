require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  let(:user) { FactoryBot.create(:user) }

  describe 'アカウントが有効になること' do
    let(:mail) { UserMailer.account_activation(user) }

    it 'メール送信先があっていること' do
      expect(mail.to).to eq ["tester4@example.com"]
      expect(mail.from).to eq ["noreply@example.com"]
    end
  end
end
