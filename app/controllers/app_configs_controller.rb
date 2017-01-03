class AppConfigsController < ApplicationController
  def index
    @cf = AppConfig.all
    
    render json: @cf
    
  end
end
