class AppConfigsController < ApplicationController
  
  def index
    @cf = AppConfig.all.order(:name)
    render json: @cf
  end
  
  def show
    @cf = find_app_config(params[:id])
    render json: @cf
  end
  
  def update
    @cf = find_app_config(params[:id])
    if @cf.update(app_config_params)
      render json: @cf 
    end 
  end
  
  def create
    @cf = AppConfig.new(app_config_params)
    if @cf.save(app_config_params)
      render json: @cf
    end 
  end

  def destroy
     @cf = find_app_config(params[:id])
    if @cf.destroy
      render json: nil
    end 
  end
  
  # Private Methoden
  private
  def find_app_config(id)
    AppConfig.find(id)
  end
  
  def app_config_params
    params.fetch(:app_config, {}).permit(:name, :description, :active)
  end
end
