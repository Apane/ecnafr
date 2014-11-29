class UserStepsController < ApplicationController

  def show
  end

  def update
    @user = current_user 
    if verify_recaptcha(:private_key => ENV['RECAPTCHA_PRIVATE_KEY'])
      redirect_to '/dashboard' || user_dashboard_path and return
      else
      flash.delete(:recaptcha_error)
      flash[:recaptcha_error] = 'The captcha did not match, please try again' 
      render :add_recaptcha
    end
  end 

  def add_recaptcha 
    @user = current_user
  end

end

