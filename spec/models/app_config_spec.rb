require 'rails_helper'

RSpec.describe AppConfig, type: :model do
  describe "active" do
    let(:cf) {
      FactoryGirl.create(:app_config, name: "My first config")
    }
    
    # neue Konfigurationen sollen immer inaktiv sein
    it "active should be set to false" do
      expect(cf.active).to be false
    end
  end
  
  # Der Name muss eindeutig sein
 
  describe "name" do
    let!(:cf) {
      FactoryGirl.create(:app_config, name: "My first config")
    }
    let!(:cf2) {
      FactoryGirl.create(:app_config, name: "My second config")
    }


    it "two records found" do
      cf_count = AppConfig.count
      expect(cf_count).to eq 2
    end
    
    it "name must be unique" do
      expect {
        cf2.update_attribute(:name, "My first config")
      }.to raise_error(ActiveRecord::RecordNotUnique)
    end
  end
  
end
