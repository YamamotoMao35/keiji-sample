class Message < ApplicationRecord
  validates :title, presence: true, length: {maximum: 10}
  validates_uniqueness_of :title
  validates :body, presence: true, length: {minimum: 6, maximum: 30}

  def self.message_list
    return Message.all.order("created_at DESC")
  end
end
