class Wiki < ActiveRecord::Base
  belongs_to :user
  has_many :collaborators
  has_many :users, through: :collaborators
  before_save :set_private
  
  def collaborator_for(user)
    collaborators.find_by(user: user)
  end
  
  private
  
  def set_private
    self.private ||= false
  end
end
