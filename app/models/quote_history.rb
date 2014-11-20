class QuoteHistory < ActiveRecord::Base
  belongs_to :subscriber
  belongs_to :quote
  validates :quote_id, :uniqueness => {scope: :subscriber_id}
end
