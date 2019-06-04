class Message < ApplicationRecord
  validates :title, presence: true, length: {maximum: 10}
  validates :body, presence: true, length: {maximum: 100}

  def self.message_list
    return Message.all.order("created_at DESC")
  end
end
