class DashboardController < ApplicationController
  before_filter :authenticate_user!, only: [:index]

  def index
    @user = current_user
    @newsletters = Newsletter.all
  end
end
