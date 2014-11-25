class SubscribersController < ApplicationController
  respond_to :html, :js

  def index
  end

  def new
    @subscriber = Subscriber.new
    
    respond_to do |format|
      format.html
      format.json
    end
  end

  def create
    @subscriber = Subscriber.new(subscriber_params)
    email = @subscriber.email if @subscriber.email.present?
    
    if @subscriber.save
      SubscriptionMailer.notify_subscription_created(email).deliver
      redirect_to root_path, notice: "You've successfully subscribed!"
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
   if subscriber.update_attribute(:subscription, false)
     redirect_to root_path, notice: "You've successfully un-subscribed."
   elsif subscriber.nil?
     flash[:notice] = "Subscription not found"
   else
     flash[:notice] = "Error while un-subscribing, please try again"
  end
end

  private

  def subscriber_params
    params.require(:subscriber).permit(:email, :category_id, :subscription, :created_at, :updated_at, :category => {},
                                      category_attributes: [:id, :name, :category_type, :created_at, :updated_at])
  end

   def permitted_params
    params.permit(:email, :category_id, :created_at, :subscription, :updated_at, :category => {},
                                      category_attributes: [:id, :name, :category_type, :created_at, :updated_at])
  end

end

