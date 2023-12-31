class PostsController < ApplicationController
  before_action :set_post, only: %i[ show update destroy ]
  include JsonHelper

  skip_before_action :authenticate_request, only: [:index, :show, :last_posts]

  # GET /posts
  def index
    @posts = Post.includes(:categories).order(created_at: :desc)
      .page(params[:page]).per(params[:per_page] || Post.default_per_page)
    render json: posts_json(@posts)
  end

  # GET /posts/1
  def show
    render json: posts_json(@post)
  end

  # GET /last/5
  def last_posts
    @posts = Post.order(created_at: :desc).limit(params[:posts_number])
    render json: posts_json(@posts)
  end

  # POST /posts
  def create

    Rails.logger.info("Params received: #{params.inspect}")

    @post = Post.new(post_params)

    if @post.save
      render json: posts_json(@post), status: :created, location: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /posts/1
  def update
    if @post.update(post_params)
      render json: posts_json(@post)
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # DELETE /posts/1
  def destroy
    @post.destroy
  end

  # DELETE CATEGORY /posts/categories/5
  def remove_category
    @post = Post.find(params[:post_id])
    @category = Category.find(params[:category_id])
    
    if @post.remove_category(@category)
      render json: { message: "#{@category.pt_name} removed" }
    else
      render json @post.errors, status: :unprocessable_entity
    end
  end

  # ADD CATEGORY /posts/categories/5
  def add_category
    @post = Post.find(params[:post_id])
    @category = Category.find(params[:category_id])
    
    if @post.add_category(@category)
      render json: { message: "#{@category.pt_name} success add" }
    else
      render json @post.errors, status: :unprocessable_entity
    end
  end

  # DELETE TAG /tags/tags/5
  def remove_tag
    @post = Post.find(params[:post_id])
    @tag = Tag.find(params[:tag_id])
    
    if @post.remove_tag(@tag)
      render json: { message: "#{@tag.name} removed" }
    else
      render json @post.errors, status: :unprocessable_entity
    end
  end

  # ADD TAG /tags/categories/5
  def add_tag
    @post = Post.find(params[:post_id])
    @tag = Tag.find(params[:tag_id])
    
    if @post.add_tag(@tag)
      render json: { message: "#{@tag.name} success add" }
    else
      render json @post.errors, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.includes(:categories).find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:pt_title, :en_title, :pt_excerpt, :en_excerpt, 
        :pt_body, :en_body, :author, :date, category_ids: [], tag_ids: [])
    end
end