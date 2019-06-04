require 'rails_helper'

RSpec.describe Message, type: :model do
  describe '#create' do
    # titleとbodyがあれば作成できること
    it "is vaild with a title, body" do
      message = build(:message)
      expect(message).to be_valid
    end

    # titleが空では作成できないこと
    it "is invalid without a title" do
      message = build(:message, title: nil)
      message.valid?
      expect(message.errors[:title]).to include("can't be blank")
    end

    # bodyが空では作成できないこと
    it "is invalid without a body" do
      message = build(:message, body: nil)
      message.valid?
      expect(message.errors[:body]).to include("can't be blank")
    end

    # titleが10文字以上であれば作成できないこと
    it "is valid with a title that has more than 10 characters" do
      message = build(:message, title: "aaaaaaaaaaa")
      message.valid?
      expect(message.errors[:title][0]).to include("is too long")
    end

    # titleが10文字以下では作成できること
    it "is valid with a title that has less than 10 characters" do
      message = build(:message, title: "aaaaaaaaaa")
      expect(message).to be_valid
    end

    # 重複したtitleが存在する場合作成できないこと
    it "is invalid with a duplicate title" do
      message = create(:message)
      another_message = build(:message, title: message.title)
      another_message.valid?
      expect(another_message.errors[:title]).to include("has already been taken")
    end

    # bodyが6文字以下であれば作成できないこと
    it "is valid with a body that has less than 6 characters" do
      message = build(:message, body: "aaaaa")
      message.valid?
      expect(message.errors[:body][0]).to include("is too short")
    end

    # bodyが30文字以上であれば作成できないこと
    it "is valid with a body that has more than 30 characters" do
      message = build(:message, body: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
      message.valid?
      expect(message.errors[:body][0]).to include("is too long")
    end

    # bodyが20文字以上であれば作成できること
    it "is valid with a body that has 6 to 30 characters" do
      message = build(:message, body: "aaaaaaaaa")
      expect(message).to be_valid
    end
  end
end
