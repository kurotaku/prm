# frozen_string_literal: true

class AgentsController < ApplicationController
  def show
    @agent = Agent.find_by(uid: params[:uid])
  end
end
