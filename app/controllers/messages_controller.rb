class MessagesController < ApplicationController
  def index
    @messages = Message.message_list
    @message = Message.new
  end

  def create
    @message = Message.new(params.require(:message).permit(:title, :body))
    if @message.save
      redirect_to action: :index
    else
      @messages = Message.message_list
      render :index
    end
  end
end
