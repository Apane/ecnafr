class Category < ActiveRecord::Base
  has_many :quotes
  has_many :subscribers
  
  CATEGORY_TYPE = {
    1 => "Business/Wealth",
    2 => "Success",
    3 => 'Ideas',
    4 => "Fitness",
    5 => "Relationships",
    6 => "Love"
  }

end
