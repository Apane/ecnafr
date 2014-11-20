class LandingController < ApplicationController
  def index
    @category = Category.all
    @quotes = Quote.where(category_id: params[:category_id]) if params[:category_id].present?
  end
end