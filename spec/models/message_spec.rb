require 'rails_helper'

RSpec.describe Message, type: :model do
  describe '#create' do
    it "is invalid without a title" do
      message = Message.new(title: "", body: "そうじゃそうじゃ")
      message.valid?
      expect(message.errors[:title]).to include("can't be blank")
    end
  end
end
