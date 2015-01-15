class PostsController < ApplicationController

  before_action :set_post, only: [:show, :update, :destroy, :edit]
  before_action :set_newsletter

  def index
    @user = current_user
    @newsletter = Newsletter.find(params[:newsletter_id])
    @posts = Post.all
  end

  def create
    @post = @newsletter.posts.build(posts_params)
   # @post.newsletter.user = current_user
    if @post.save

      redirect_to newsletter_post_path(@newsletter, @post), notice: "Post successfully published."
    else
      flash[:alert] = "Post could not be published."
      render "new"
    end
  end

  def new
    @post = @newsletter.posts.build
  end

  def show
  end

  def update
    if @post.update(posts_params)
      redirect_to [@newsletter, @post], notice: "Post successfully updated."
    else
      flash[:alert] = "Post has not been updated."
      render "edit"
    end
  end

  def edit
  end

  def destroy
    @post.destroy

    flash[:notice] = "Post was deleted."
    redirect_to @newsletter
  end

  private

  def set_post
    @newsletter = Newsletter.find(params[:newsletter_id])
    @post = @newsletter.posts.find(params[:id])
  end

  def set_newsletter
    @newsletter = Newsletter.find(params[:newsletter_id])
    rescue ActiveRecord::RecordNotFound
    flash[:alert] = "The newsletter you were looking " + 
                    "for could not be found."
    redirect_to root_path                    
  end

  def posts_params
    params.require(:post).permit(:title, :body, :newsletter_id)
  end

end