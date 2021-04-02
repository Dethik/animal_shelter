class CatsController < ApplicationController
  swagger_controller :cats, "Available Cats"

  swagger_api :index do
    summary "Fetches all cats"
    notes "This lists all the available cats"
    response :ok, "Success"
    response :unauthorized
    response :not_acceptable, "The request you made is not acceptable"
  end
  def index
    @cats = Cat.all
    json_response(@cats)
  end

  swagger_api :show do
    summary "Fetches a single Cat"
    param :path, :id, :integer, :optional, "Cat Id"
    response :ok, "Success", :Cat
    response :unauthorized
    response :not_acceptable
    response :not_found
  end
  def show
    @cat = Cat.find(params[:id])
    json_response(@cat)
  end

  swagger_api :create do
    summary "Creates a new Cat"
    param :form, :name, :string, :required, "Name"
    param :form, :gender, :string, :required, "Gender"
    param :form, :breed, :string, :required, "Breed"
    param :form, :size, :string, :required, "Size"
    response :unauthorized
    response :not_acceptable
  end
  def create
    @cat = Cat.create!(cat_params)
    json_response(@cat, :created)
  end

  swagger_api :update do
    summary "Updates an existing Cat"
    param :path, :id, :integer, :required, "Cat Id"
    param :form, :name, :string, :required, "Name"
    param :form, :gender, :string, :required, "Gender"
    param :form, :breed, :string, :required, "Breed"
    param :form, :size, :string, :required, "Size"
    response :unauthorized
    response :not_found
    response :not_acceptable
  end
  def update
    @cat = Cat.find(params[:id])
    if @cat.update!(cat_params)
      render status: 200, json: {
        message: "This cat has been updated successfully."
      }
    end
  end

  swagger_api :destroy do
    summary "Deletes an existing Cat"
    param :path, :id, :integer, :optional, "User Id"
    response :unauthorized
    response :not_found
  end
  def destroy
    @cat = Cat.find(params[:id])
    if @cat.destroy!
      render status: 200, json: {
        message: "This cat has been deleted successfully."
      }
    end
  end

  private
  def json_response(object, status = :ok)
    render json: object, status: status
  end

  def cat_params
    params.permit(:name, :gender, :breed, :size)
  end
end