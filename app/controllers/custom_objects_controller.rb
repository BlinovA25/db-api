class CustomObjectsController < ApplicationController
  before_action :check_token
  before_action :set_custom_object, only: %i[ show update destroy ]

  # GET /custom_objects
  def index
    @custom_objects = CustomObject.all

    render json: @custom_objects
  end

  # GET /custom_objects/1
  def show
    render json: @custom_object
  end

  # POST /custom_objects
  def create
    @custom_object = CustomObject.new(custom_object_params)

    if @custom_object.save
      render json: @custom_object, status: :created, location: @custom_object
    else
      render json: @custom_object.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /custom_objects/1
  def update
    if @custom_object.update(custom_object_params)
      render json: @custom_object
    else
      render json: @custom_object.errors, status: :unprocessable_entity
    end
  end

  # DELETE /custom_objects/1
  def destroy
    @custom_object.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_custom_object
    @custom_object = CustomObject.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def custom_object_params
    params.require(:custom_object).permit(:owner, data: {})
  end
end
