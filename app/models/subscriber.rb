class Subscriber < ActiveRecord::Base
  belongs_to :category  

  validates :email, presence: true
  validates :category_id, presence: true

  def choose_quote(cat)
    quote = cat.quotes.uniq_quote_for(self.id).order("RANDOM()").first 
    return quote if self.quote_histories.create(qoute_id: quote.id)
    return nil
  end

end
