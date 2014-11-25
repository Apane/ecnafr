class UserStepsController < ApplicationController

  def show
  end

  def update
    @user = current_user 
    if verify_recaptcha
      if @user.save 
        redirect_to root_path and return
      else
        render :add_recaptcha 
        flash[:notice] = "Didn't save"
      end
    end
  end

  def add_recaptcha 
    @user = current_user
  end

end
