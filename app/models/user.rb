class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, 
         :validatable

  has_many :subscriptions
  has_many :subscribed_newsletters, through: :subscriptions, class_name: "Newsletter"
  has_many :newsletters

  validates :email, uniqueness: true, presence: true
  validates_presence_of :password, on: :create         

  def subscribed?(user)
    subscription_id = self.subscriptions.pluck(:subscription_id)
    if subscription_id.include? user.id
      true
    end
  end

end
