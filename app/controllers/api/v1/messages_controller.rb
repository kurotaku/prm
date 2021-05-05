class Api::V1::MessagesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    board = Board.find_by(uid: params[:board][:uid])
    @message = board.messages.create(message_params)
    render json: @message
  end

  private

  def message_params
    params.require(:message).permit(:content).merge(user_id: current_user.id)
  end
end
