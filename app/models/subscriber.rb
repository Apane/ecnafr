class Subscriber < ActiveRecord::Base
  belongs_to :category  
  has_many :quote_histories

  validates :email, presence: true
  validates :category_id, presence: true

  def choose_quote(cat)
    quote = cat.quotes.uniq_quote_for(self.id).order("RANDOM()").first 
    return nil if quote.nil? # so if we didn't able to find in quote lets return from here with nil!k
    return quote if self.quote_histories.create quote ande(quote_id: quote.id) # so here we won't need to test for nil! 
    #so this will reduce the time to perform this operation
  end
end