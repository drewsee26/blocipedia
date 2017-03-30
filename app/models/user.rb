class User < ActiveRecord::Base
  has_many :wikis
  
  after_initialize :user_role
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable
         
  enum role: [:standard, :premium, :admin]
  
  def user_role
    self.role ||= :standard
  end
end
