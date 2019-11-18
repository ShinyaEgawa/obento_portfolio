require 'rails_helper'

RSpec.describe Micropost, type: :model do
  let(:micropost) { FactoryBot.create(:micropost) }

  describe Micropost do
    it '有効なファクトリを持つこと' do
      expect(micropost).to be_valid
    end

    it ':micropostのuser_idがnilの場合、無効になっていること' do
      FactoryBot.create(:micropost)
      micropost = FactoryBot.build(:micropost, user_id: nil)
      micropost.valid?
      expect(micropost).to_not be_valid
    end

    it ':micropostのcontentが空欄の場合、無効になっていること' do
      FactoryBot.create(:micropost)
      micropost = FactoryBot.build(:micropost, content: " ")
      micropost.valid?
      expect(micropost).to_not be_valid
    end

    it ':micropostのcontentが140文字を超えたら無効になること' do
      FactoryBot.create(:micropost)
      micropost = FactoryBot.build(:micropost, content: "a" * 301)
      micropost.valid?
      expect(micropost).to_not be_valid
    end

    it ':userのnameが空欄の場合、無効になっていること' do
      FactoryBot.create(:user)
      user = FactoryBot.build(:user, name: " ")
      user.valid?
      expect(user).to_not be_valid
    end

    it ':userのemailが空欄の場合、無効になっていること' do
      FactoryBot.create(:user)
      user = FactoryBot.build(:user, email: " ")
      user.valid?
      expect(user).to_not be_valid
    end
  end
end
