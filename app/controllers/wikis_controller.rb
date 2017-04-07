class WikisController < ApplicationController
    def index
        @wikis = Wiki.all
        #@wikis = policy_scope(Wiki)
    end
    
    def show
        @wiki = Wiki.find(params[:id])
        authorize @wiki
    end
    
    def new
        @wiki = Wiki.new
        authorize @wiki
    end
    
    def create
        @wiki = Wiki.new(wiki_params)
        @wiki = current_user.wikis.new
        authorize @wiki
        
        
        if @wiki.save
            flash[:notice] = "Wiki was saved."
            redirect_to @wiki
        else
            flash.now[:alert] = "There was an error saving the wiki.  Please try again."
            render :new
        end
    end
    
    def edit
        @wiki = Wiki.find(params[:id])
        authorize @wiki
    end
    
    def update
        @wiki = Wiki.find(params[:id])
        @wiki.assign_attributes(wiki_params)
        authorize @wiki
        
        if @wiki.save
            flash[:notice] = "Wiki was saved."
            redirect_to @wiki
        else
            flash.now[:alert] = "There was an error saving the wiki.  Please try again."
            render :edit
        end
    end
    
    def destroy
        @wiki = Wiki.find(params[:id])
        authorize @wiki
        
        if @wiki.destroy
            flash[:notice] = "\"#{@wiki.title}\" was deleted successfully."
            redirect_to wikis_path
        else
            flash.now[:alert] = "There was an error deleting this post."
            render :show
        end
    end
    
    private 
    
    def wiki_params
        params.require(:wiki).permit(:title, :body)
    end
    
end
