class BlogsController < ApplicationController
    before_action :set_blog, only: [:show, :edit, :update, :destroy]
  # lister les blog avec action index et remplir index.thml.erb
  def index
    @blogs = Blog.all
  end

  def new
    @blog = Blog.new
  end


  def create
    # pour remplacer @blog et @blog.user_id
   @blog = current_user.blogs.build(blog_params)
    #@blog = Blog.new(blog_params)
    # insert the vlue of forreign key
    #@blog.user_id = current_user.id
    if params[:back]
      render :new
    else
      if @blog.save
        redirect_to blogs_path, notice: "I have created a blog!"
      else
        render :new
      end
    end
  end


  # show action when show is called new.html is also called
  def show
    #@blog = Blog.find(params[:id])
  end

  def edit
     #@blog = Blog.find(params[:id])
  end

  def destroy
    @blog.destroy
    redirect_to blogs_path, notice:"I deleted the blog!"
  end


  def update
    #@blog = Blog.find(params[:id])
    if @blog.update(blog_params)
      redirect_to blogs_path, notice: "I edited the blog!"
    else
      render :edit
    end
  end

  def confirm
# pour remplacer @blog et @blog.user_id
  #  @blog = current_user.blogs.build(blog_params)
  @blog = current_user.blogs.build(blog_params)
    #@blog = Blog.new(blog_params)
    # insert value forreign key
    #@blog.user_id = current_user.id
    render :new if @blog.invalid?
  end

  private
  def blog_params
    params.require(:blog).permit(:title, :content)
  end

  def set_blog
    @blog = Blog.find(params[:id])
  end

end
