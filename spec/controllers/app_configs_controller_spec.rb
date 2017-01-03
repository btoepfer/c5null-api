require 'rails_helper'

RSpec.describe AppConfigsController, type: :controller do
  describe "GET #index" do
    let!(:cf1) {
      FactoryGirl.create(:app_config, name: "My first config")
    }
    let!(:cf2) {
      FactoryGirl.create(:app_config, name: "My second config")
    }

    it "two records found" do
      get :index
      expect(assigns(:cf)).to match_array([cf1, cf2]) 
    end
    
  end
end
