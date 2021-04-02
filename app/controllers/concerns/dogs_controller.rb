class DogsController < ApplicationController
  swagger_controller :dogs, "Available Dogs"

  swagger_api :index do
    summary "Fetches all Dogs"
    notes "This lists all the available Dogs"
    response :ok, "Success"
    response :unauthorized
    response :not_acceptable, "The request you made is not acceptable"
  end
  def index
    @dogs = Dog.all
    json_response(@dogs)
  end

  swagger_api :show do
    summary "Fetches a single Dog"
    param :path, :id, :integer, :optional, "Dog Id"
    response :ok, "Success", :Dog
    response :unauthorized
    response :not_acceptable
    response :not_found
  end
  def show
    @dog = Dog.find(params[:id])
    json_response(@dog)
  end

  swagger_api :create do
    summary "Creates a new Dog"
    param :form, :name, :string, :required, "Name"
    param :form, :gender, :string, :required, "Gender"
    param :form, :breed, :string, :required, "Breed"
    param :form, :size, :string, :required, "Size"
    response :unauthorized
    response :not_acceptable
  end
  def create
    @dog = Dog.create!(dog_params)
    json_response(@dog, :created)
  end

  swagger_api :update do
    summary "Updates an existing Dog"
    param :path, :id, :integer, :required, "Dog Id"
    param :form, :name, :string, :required, "Name"
    param :form, :gender, :string, :required, "Gender"
    param :form, :breed, :string, :required, "Breed"
    param :form, :size, :string, :required, "Size"
    response :unauthorized
    response :not_found
    response :not_acceptable
  end
  def update
    @dog = Dog.find(params[:id])
    if @dog.update!(dog_params)
      render status: 200, json: {
        message: "This dog has been updated successfully."
      }
    end
  end

  swagger_api :destroy do
    summary "Deletes an existing Dog"
    param :path, :id, :integer, :optional, "User Id"
    response :unauthorized
    response :not_found
  end
  def destroy
    @dog = Dog.find(params[:id])
    if @dog.destroy!
      render status: 200, json: {
        message: "This dog has been deleted successfully."
      }
    end
  end

  private
  def json_response(object, status = :ok)
    render json: object, status: status
  end

  def dog_params
    params.permit(:name, :gender, :breed, :size)
  end
end