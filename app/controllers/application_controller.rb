class ApplicationController < ActionController::Base
  def index
    @blogs = Blog.all
  end

  def new
    @blog = Blog.new
  end

  def show
    @blog = Blog.find(params[:id])
  end

  def create
    @blog = Blog.new(blog_params)

    if @blog.save
      redirect_to @blog
    else 
      render:new
    end
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def update
    @blog = Blog.find(params[:id])

    if @blog.update(blog_params)
      redirect_to @blog
    else
      render :edit
    end
  end

  def destroy 
    @blog = Blog.find(params[:id])
    @blog.destroy

    redirect_to action: "index"
  end

  private
    def blog_params
      params.require(:blog).permit(:title, :author, :body)
    end
end
