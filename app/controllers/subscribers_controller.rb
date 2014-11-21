class SubscribersController < ApplicationController
  def index
  end

  def new
    @subscriber = Subscriber.new
  end

  def create
    @subscriber = Subscriber.new(subscriber_params)

    if @subscriber.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def unsubscribe
   subscriber = Subscriber.find_by_unsubscribe_hash(params[:unsubscribe_hash])
   if subscribe and subscriber.update_attributes(:subscription, false)
     redirect_to root_path
   elsif subscribe.nil?
     flash[:notice] = "Subscription not found"
   else
     flash[:notice] = "Error while un-subscribing, please try again"
  end
end

  private

  def subscriber_params
    params.require(:subscriber).permit(:email, :category_id, :created_at, :updated_at, :category => {},
                                      category_attributes: [:id, :name, :category_type, :created_at, :updated_at])
  end

   def permitted_params
    params.permit(:email, :category_id, :created_at, :updated_at, :category => {},
                                      category_attributes: [:id, :name, :category_type, :created_at, :updated_at])
  end

  def attr_params_category
    params.require(:account).permit(category_attributes: [:id, :name, :category_type, :created_at, :updated_at, :category => {}])
  end

end

