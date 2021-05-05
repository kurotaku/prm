class Api::V1::BoardsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
  end

  def show
    render json: Board.find_by(
                  related_object: params[:related_object],
                  related_object_uid: params[:related_object_uid]
                 ), serializer: BoardSerializer
  end

  def message_params
    params.require(:message).permit(:board_id, :user_id, :content)
  end
end
