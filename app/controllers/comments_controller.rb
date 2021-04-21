class CommentsController < ApplicationController
  before_action :set_post
  before_action :set_comment, only: [:show, :update, :destroy]
  # GET /comments
  def index
    @comments = @post.comments

    render json: @comments
  end

  # GET /comments/1
  def show
    render json: @comment
  end

  # POST /comments
  def create
    @comment = @post.comments.new(comment_params.merge(user_id: logged_in_user.id))
    if @comment.save
      render json: @comment, status: :created
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /comments/1
  def update
    return render json: {"Error":"Unauthorized attempt"}, status: :unauthorized unless @comment.user_id==logged_in_user.id

    if @comment.update(comment_params)
      render json: @comment
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /comments/1
  def destroy
    return render json: {"Error":"Unauthorized attempt"}, status: :unauthorized unless @comment.user_id==logged_in_user.id

    return render json: {"Error":"comment not found"}, status: :not_found unless @comment
       
    @comment.destroy
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params["post_id"])
    end

    def set_comment
      @comment = @post.comments.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def comment_params
      params.require(:comment).permit(:body)
    end
end
