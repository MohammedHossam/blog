class PostsController < ApplicationController
  before_action :set_post, only: [:show, :update, :destroy]

  # GET /posts
  def index
    @posts = Post.all
    render json: @posts
  end

  # GET /posts/1
  def show
    render json: { post: @post, comments: @post.comments, tags: @post.tags }
  end

  # POST /posts
  def create
    @post = logged_in_user.posts.new(post_params)
    tags = params["tags"]
    if tags && tags.length()>0 
      @post.save
      tags.each do |item|
        tag =Tag.find_or_create_by(name: item)
        @post.poststags.create(tag_id: tag.id)
      end
    end
    if tags && tags.length()>0 && @post.save
      HardWorker.perform_in(24.hours.from_now, @post.id)
      render json: @post, status: :created, location: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /posts/1
  def update
    return render json: {"Error":"Unauthorized attempt"}, status: :unauthorized unless @post.user_id==logged_in_user.id

    tags = params["tags"]
    if tags && tags.length()>0 
      @post.poststags.destroy_all
      tags.each do |item|
        tag =Tag.find_or_create_by(name: item)
        @post.poststags.create(tag_id: tag.id)
      end
    end
    if @post.update(post_params)
      render json: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # DELETE /posts/1
  def destroy
    return render json: {"Error":"Unauthorized attempt"}, status: :unauthorized unless @post.user_id==logged_in_user.id

    return render json: {"Error":"post not found"}, status: :not_found unless @post
    
    @post.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:title, :body)
    end
end
