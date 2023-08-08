class CategoriesController < ApplicationController
  before_action :set_category, only: %i[ show update destroy ]
  include JsonHelper

  skip_before_action :authenticate_request, only: [:index, :show]

  # GET /categories
  def index
    @categories = Category.all

    render json: @categories
  end

  # GET posts /categories/1/posts
  def posts
    @category = Category.find(params[:category_id])
    @posts = @category.posts.order(created_at: :desc)
      .page(params[:page]).per(params[:per_page] || Category.default_per_page)

    render json: posts_json(@posts)
  end

  # GET /categories/1
  def show
    render json: @category
  end

  # POST /categories
  def create
    @category = Category.new(category_params)

    if @category.save
      render json: @category, status: :created, location: @category
    else
      render json: @category.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /categories/1
  def update
    if @category.update(category_params)
      render json: @category
    else
      render json: @category.errors, status: :unprocessable_entity
    end
  end

  # DELETE /categories/1
  def destroy
    @category.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def category_params
      params.require(:category).permit(:pt_name, :en_name)
    end
end
