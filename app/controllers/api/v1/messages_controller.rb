# frozen_string_literal: true
module Api
  class V1::MessagesController < ApiController
    skip_before_action :verify_authenticity_token

    def create
      board = Board.find_by(uid: params[:board][:uid])
      @message = board.messages.create(message_params)
      render json: @message
    end

    private
      def message_params
        current_staff =  current_user.staffs.find_by(vendor_group_id: Board.find_by(uid: params[:board][:uid]).vendor_group.id)
        params.require(:message).permit(:content).merge(staff_id: current_staff.id)
      end
  end
end
