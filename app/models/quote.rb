class Quote < ActiveRecord::Base
  belongs_to :category
  has_many :quote_histories

  validates :title, presence: true

  scope :uniq_quote_for, Proc.new {|subscriber_id| includes(:quote_histories).where.not(quote_histories: {subscriber_id: subscriber_id})}

end
