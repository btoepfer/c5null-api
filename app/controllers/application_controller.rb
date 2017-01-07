class ApplicationController < ActionController::API
  def alive
    @alive_test = AliveTest.first
    @alive_test.message = Time.now.strftime("#{@alive_test.message} am %d.%m.%Y um %H:%M Uhr")
    render json: @alive_test
  end
end
