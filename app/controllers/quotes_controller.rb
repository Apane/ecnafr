class QuotesController < ApplicationController
  before_action :set_quote, only: [:show, :edit, :update, :destroy]
  
  def index
    @quotes = Quote.all
  end

  def show
  end

  def new
    @quote = Quote.new
  end

  def create
    @quote = Quote.new(quote_params)
    if @quote.save?
      redirect_to root_path, notice: "You've successfully added a quote"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @quote.update(quote_params)
      redirect_to root_path, notice: "You've successfully updated your quote"
    else
      render :edit
    end
  end

  def destroy
    @quote.destroy
    redirect_to root_path, notice: "Quote was destroyed!"
  end

  private

  def set_quote
    @quote = Quote.find(params[:id])
  end

  def quote_params
    params.require(:quote).permit(:title, :body)
  end
end