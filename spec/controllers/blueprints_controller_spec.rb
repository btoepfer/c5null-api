require 'rails_helper'

RSpec.describe BlueprintsController, type: :controller do
  describe "GET #index" do
    let!(:cf1) {
      FactoryGirl.create(:blueprint, name: "My first config")
    }
    let!(:cf2) {
      FactoryGirl.create(:blueprint, name: "My second config")
    }

    it "two records found" do
      get :index
      expect(assigns(:cf)).to match_array([cf1, cf2]) 
    end
    
  end
  
  describe "GET #show" do
    let!(:cf1) {
      FactoryGirl.create(:blueprint, id: 1, name: "My first config")
    }
    let!(:cf2) {
      FactoryGirl.create(:blueprint, id: 2, name: "My second config")
    }

    it "first record found" do
      get :show, params: { id: 1 }
      expect(assigns(:cf)).to eq(cf1) 
    end
    
    it "returns http 200" do
      get :show, params: { id: 1 }
      expect(response.status).to eq(200)
    end
    
    it "renders json" do
      get :show, params: { id: 2 }
      expect(response.body).to match /My second config/im
    end
  end
  
  describe "PUT #update" do
    let!(:cf1) {
      FactoryGirl.create(:blueprint, id: 1, name: "My first config")
    }
    
    it "returns updated record" do
      put :update, :params => {id: 1, blueprint: {name: "My updated config"}, format: :json}
      expect(response.body).to match /My updated config/im
    end
  end 
  
  describe "POST #create" do
    it "returns created record" do
      post :create, :params => {blueprint: {name: "My new config"}, format: :json}
      expect(response.body).to match /My new config/im
    end
  end 
  
end
