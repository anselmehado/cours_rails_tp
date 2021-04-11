class BlogsController < ApplicationController
    before_action :set_blog, only: [:show, :edit, :update, :destroy]
  # lister les blog avec action index et remplir index.thml.erb
  def index
    @blogs = Blog.all
  end

  # afficher les liste des Blogs : creer l'action new  avec une instance +  la vu new.html.erb
  # ajouteer l'instance dans le formulaire vue par @blog
  def new
    @blog = Blog.new
  end

  # creer un nouvo blog: poster il faut creer l'action create




  # def create
  #   @blog = Blog.new(blog_params)
  #     if @blog.save
  #       # 一覧画面へ遷移して"I have created a blog!"とメッセージを表示します。
  #    redirect_to blogs_path, notice: "I have created a blog!"
  #  else
  #    render :new
  #  end
  #   # renvoi une nvlle page pour poster a nouveau un blog redirect_to
  #   #"/blogs/new"= redirect_to new_blog_path
  #   #redirect_to "/blogs/new"
  #   #redirect_to new_blog_path
  # end


  def create
    @blog = Blog.new(blog_params)
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
    @blog = Blog.new(blog_params)
    render :new if @blog.invalid?
  end

  private
  def blog_params
    params.require(:blog).permit(:title, :content)
  end

  def set_blog
    @blog = Blog.find(params[:id])
  end



# fin action create



end
