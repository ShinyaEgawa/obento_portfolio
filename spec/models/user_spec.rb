require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { FactoryBot.create(:user) }

  describe User do
    it '有効なファクトリを持つこと' do
      expect(user).to be_valid
    end
  end

  describe '全てのバリデーションが通ること' do
    it {is_expected.to validate_presence_of :name}
    it {is_expected.to validate_length_of(:name).is_at_most(30)}
    it {is_expected.to validate_presence_of :nickname}
    it {is_expected.to validate_length_of(:nickname).is_at_most(30)}
    it {is_expected.to validate_presence_of :email}
    it {is_expected.to validate_length_of(:email).is_at_most(255)}
    it {is_expected.to validate_presence_of :password}
    it {is_expected.to validate_length_of(:password).is_at_least(6)}
    it {is_expected.to validate_presence_of :self_introduction}
    it {is_expected.to validate_length_of(:self_introduction).is_at_most(500)}
  end

  it '重複したメールアドレスは無効になること' do
    FactoryBot.create(:user, email: "Tester@example.com")
    user = FactoryBot.build(:user, email: "tester@example.com")
    user.valid?
    expect(user.errors[:email]).to include("has already been taken")
  end

  describe 'メールアドレスの有効性のテスト' do
    it '無効なメールアドレスの場合登録されないこと' do
      invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                            foo@bar_baz.com foo@bar+baz.com]
      invalid_addresses.each do |invalid_address|
        user.email = invalid_address
        expect(user).to_not be_valid
      end
    end

    it '有効なメールアドレスの場合登録されること' do
      valid_addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      valid_addresses.each do |valid_address|
        user.email = valid_address
        expect(user).to be_valid
      end
    end
  end

  describe 'パスワード認証の一致性のテスト' do
    it '一致しない場合認証されないこと' do
      user = FactoryBot.build(:user, password: "password", password_confirmation: "foobar")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end

    it '一致する場合認証が完了されること' do
      user = FactoryBot.build(:user, password: "password", password_confirmation: "password")
      expect(user).to be_valid
    end
  end
end
