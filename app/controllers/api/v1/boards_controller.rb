class Api::V1::BoardsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create; end

  def show
    p params
    p params[:related_object]
    p params[:related_object_uid]
    board = Board.where(related_object: params[:related_object], related_object_uid: params[:related_object_uid]).last
    p board
    render json: board, serializer: BoardSerializer
  end

  def message_params
    params.require(:message).permit(:board_id, :user_id, :content)
  end
end
