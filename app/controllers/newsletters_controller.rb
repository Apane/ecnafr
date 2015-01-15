class NewslettersController < ApplicationController
  before_filter :authenticate_user!, only: [:my_newsletters]
  before_action :set_user
  before_action :set_newsletter, only: [:show, :update, :edit, :destroy]

  def index
    @newsletters = Newsletter.all
  end

  def new
    @newsletter = @user.newsletters.build
  end

  def create
    @newsletter = @user.newsletters.build(newsletter_params)
    if @newsletter.save
      redirect_to new_newsletter_post_path(@newsletter, @post), notice: "You've successfully created a newsletter"
    else
      render :new
    end
  end

  def my_newsletters
    @newsletters = @user.newsletters.order(created_at: :desc)
  end

  def show
  end

  def edit
  end

  def update
    if @newsletter.update(newsletter_params)
      redirect_to @newsletter, notice: "Newsletter succesfully updated."
    else
      render :edit
    end
  end

  def destroy   
    @newsletter.destroy

    redirect_to my_newsletters_path, notice: "Your newsletter has been deleted."
  end

  private

  def set_user
    @user = current_user
  end

  def set_newsletter
    @newsletter = @user.newsletters.find(params[:id])
  end

  def newsletter_params
    params.require(:newsletter).permit(:name, :image, :user_id)
  end

end
