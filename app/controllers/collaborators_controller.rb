class CollaboratorsController < ApplicationController
  def index
    @collaborators = User.all
  end
  
  def new
    @collaborator = Collaborator.new
  end
  
  def create
    @collaborator = Collaborator.where(user_id: @user.id)
  end
  
  def destroy
    @collaborator = current_user.collaborator.delete
    
    if @collaborator.destroy
      flash[:notice] = "\"#{@collaborator.email}\" was removed as a Collaborator successfully."
        redirect_to wiki_collaborators_path(@wiki)
    else
      flash.now[:alert] = "There was an error deleting this post."
      render :index
    end
  end
end
