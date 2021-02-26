class CommentsController < ApplicationController
  before_action :get_blog
  def index
    @comments = @blog.comments
  end

  def new
    @comment = @blog.comments.build
  end

  def create
    @comment = @blog.comments.build(comment_params)
      if @comment.save
        redirect_to blog_comments_path
      else
        render :new
      end
  end

  def edit
    @comment = @blog.comments.find(params[:id])
  end

  def update
    @comment = @blog.comments.find(params[:id])

    if @comment.update(comment_params)
      redirect_to blog_comments_url
    else
      render :edit
    end
  end

  def destroy
    @comment = @blog.comments.find(params[:id])
    @comment.destroy

    redirect_to action: "index"
  end

  private

  def get_blog
    @blog = Blog.find(params[:blog_id])
  end

  def comment_params
    params.require(:comment).permit(:content, :user, :blog_id)
  end
end

