class BlueprintsController < ApplicationController
  
  def index
    @cf = Blueprint.all.order(:name)
    render json: @cf
  end
  
  def show
    @cf = find_blueprint(params[:id])
    render json: @cf
  end
  
  def update
    @cf = find_blueprint(params[:id])
    if @cf.update(blueprint_params)
      render json: @cf 
    end 
  end
  
  def create
    @cf = Blueprint.new(blueprint_params)
    if @cf.save(blueprint_params)
      render json: @cf
    end 
  end

  def destroy
     @cf = find_blueprint(params[:id])
    if @cf.destroy
      render json: nil
    end 
  end
  
  # Private Methoden
  private
  def find_blueprint(id)
    Blueprint.find(id)
  end
  
  def blueprint_params
    params.fetch(:blueprint, {}).permit(:name, :description, :active)
  end
end
