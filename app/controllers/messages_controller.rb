class MessagesController < ApplicationController
  before_action :set_message_for_destroy, only: [ :destroy ]
  def index
    @user= User.find(params[:user_id])
    @messages = Message.where(recipient: @user).includes(:sender)
    @sent_messages = Message.where(sender: @user).includes(:recipient)
  end

  def show
    @message = Message.includes(:sender, :recipient).find(params[:id])
  end

  def new
    @recipient = User.find(params[:user_id])
    @message = Message.new
  end


  def create
    @recipient = User.find(params[:user_id])
    @message = Message.new(params.require(:message).permit(:content))
    @message.sender = current_user
    @message.recipient = @recipient
    # @message.create!(sender_id: current_user, recipient: @recipient, content: "hi")
    if @message.save
      redirect_to user_messages_path(current_user)
    end
  end

  def destroy
    @message.destroy
    redirect_to user_messages_path(current_user)
  end

  private
  def set_message_for_destroy
    @message = Message.find(params[:id])
    # Optional: Ensure only sender or recipient can delete
    unless @message.sender == current_user || @message.recipient == current_user
      redirect_to user_messages_path(current_user), alert: "You are not authorized to delete this message."
    end
  end
end
