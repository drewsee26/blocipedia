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
    end
    
    describe "POST create" do
        it "returns http success" do
            post :create
            expect(response).to have_http_status(:success)
        end
    end
    
    describe "GET edit" do
        it "returns http success" do
            get :edit
            expect(response).to have_http_status(:success)
        end
    end
    
    describe "PUT update" do
        it "returns http success" do
            put :update
            expect(response).to have_http_status(:success)
        end
    end
    
    describe "DELETE destroy" do
        it "returns http success" do
            delete :destroy
            expect(response).to have_http_status(:success)
        end
    end
end
