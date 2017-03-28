require 'rails_helper'

RSpec.describe WikisController, type: :controller do
    
    
    describe "GET index" do
        it "returns http success" do
            get :index
            expect(response).to have_http_status(:success)
        end
    end
    
    describe "GET show" do
        it "returns http success" do
            get :show
            expect(response).to have_http_status(:success)
        end
    end
    
    describe "GET new" do
        it "returns http success" do
            get :new
            expect(response).to have_http_status(:success)
        end
        
        it "renders the #new view" do
            get :new
            expect(response).to render_template :new
        end
        
        it "instantiates @wiki" do
            get :new
            expect(assigns(:wiki)).not_to be_nil
        end
    end
    
    describe "POST create" do
        it "increases the number of Wiki by 1" do
            expect{post :create, wiki: {title: "My Wiki Title", body: "My Wiki Body", private: boolean}}.to change(Wiki,:count).by(1)
        end
        
        it "assigns the new wiki to @wiki" do
            post :create, wiki: {title: "My Wiki Title", body: "My Wiki Body", private: boolean}
            expect(assigns(:wiki)).to eq Wiki.last
        end
        
        it "redirects to the new wiki" do
            post :create, wiki: {title: "My Wiki Title", body: "My Wiki Body", private: boolean}
            expect(response).to redirect_to Wiki.last
        end
    end
    
    describe "GET edit" do
        it "returns http success" do
            get :edit
            expect(response).to have_http_status(:success)
        end
    end
    
   
end
