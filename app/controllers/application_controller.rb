class ApplicationController < ActionController::API
  def alive
    @alive_test = AliveTest.first
    render json: @alive_test
  end
end
