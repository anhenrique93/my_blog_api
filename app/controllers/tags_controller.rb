class TagsController < ApplicationController
    before_action :set_tag, only: %i[ show update destroy ]
    include JsonHelper
  
    # GET /tags
    def index
      @tags = Tag.all
  
      render json: @tags
    end
  
    # GET tags /tags/1/posts
    def posts
      @tag = Tag.find(params[:tag_id])
      @posts = @tag.posts.order(created_at: :desc)
        .page(params[:page]).per(params[:per_page] || Tag.default_per_page)
  
      render json: posts_json(@posts)
    end
  
    # GET /tags/1
    def show
      render json: @tag
    end
  
    # POST /tags
    def create
      @tag = Tag.new(tag_params)
  
      if @tag.save
        render json: @tag, status: :created, location: @tag
      else
        render json: @tag.errors, status: :unprocessable_entity
      end
    end
  
    # PATCH/PUT /tags/1
    def update
      if @tag.update(tag_params)
        render json: @tag
      else
        render json: @tag.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /tags/1
    def destroy
      @tag.destroy
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_tag
        @tag = Tag.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
      def tag_params
        params.require(:tag).permit(:name)
      end
  end
  