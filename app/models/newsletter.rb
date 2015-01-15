class Newsletter < ActiveRecord::Base
  has_many :subscriptions
  has_many :users, through: :subscriptions
  has_many :posts, dependent: :destroy
  belongs_to :user
  has_attached_file :image, styles: {thumb: "100x100>", medium: "300x300>", youtube: "196x110>"}, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  validates_presence_of :image, :name

  scope :for, ->(user) do
    if user 
      Newsletter.all
    end
  end

end
