class SubscriptionsController < ApplicationController
  before_filter :set_newsletter, only: [:create, :update, :destroy, :show]

 def create
     @subscription = current_user.subscriptions.build(newsletter: @newsletter)
     if @subscription.save
      redirect_to newsletters_path, notice: "You've successfully subscribed"
     else
      flash[:notice] = "Something went wrong."
      render :new
     end
   end

  def destroy
  end

  def toggle_subscription
    @subscription_id = params[:subscription_id] # sent to js.erb
    if params[:action_type] == 'remove'
      current_user.subscriptions.where('subscription_id = ?', @subscription_id).first.destroy
    elsif params[:action_type] == 'add'
      current_user.subscriptions.find_or_create_by(subscription_id: @fav_id)
    end
  end  

  def private
    def set_newsletter
      @newsletter = Newsletter.find(params[:newsletter_id])
    end

    def subscription_params
      params.require(:subscription).permit(:user_id, :newsletter_id)
    end
  end

end
