class MessagesController < ApplicationController
  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    if @message.valid?
      MessageMailer.message_me(@message).deliver_now
      flash[:info] = 'Thank you for your message!'
      redirect_to new_message_path
    else
      flash[:danger] = 'Something went wrong.  Unable to send message.'
      render :new
    end
  end

  private

    def message_params
      params.require(:message).permit(:name, :email, :subject, :content)
    end
end
