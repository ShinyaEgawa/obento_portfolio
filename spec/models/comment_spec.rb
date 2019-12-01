require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:comment) { FactoryBot.create(:comment) }

  describe Comment do
    it '有効なファクトリを持つこと' do
      expect(comment).to be_valid
    end

    it ':commentのbodyが空欄の場合、無効になっていること' do
      FactoryBot.create(:comment)
      comment = FactoryBot.build(:comment, body: " ")
      comment.valid?
      expect(comment).to_not be_valid
    end

    it 'bodyが300文字を超えたら無効になること' do
      FactoryBot.create(:comment)
      comment = FactoryBot.build(:comment, body: "a" * 301)
      comment.valid?
      expect(comment).to_not be_valid
    end

    it ':commentのuser_idがnilの場合、無効になっていること' do
      FactoryBot.create(:comment)
      comment = FactoryBot.build(:comment, user_id: nil)
      comment.valid?
      expect(comment).to_not be_valid
    end

    it ':commentのmicropost_idがnilの場合、無効になっていること' do
      FactoryBot.create(:comment)
      comment = FactoryBot.build(:comment, micropost_id: nil)
      comment.valid?
      expect(comment).to_not be_valid
    end
  end
end
