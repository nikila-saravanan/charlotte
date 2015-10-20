require 'rails_helper'

RSpec.describe WebController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #data" do
    it "returns http success" do
      get :data
      expect(response).to have_http_status(:success)
    end
  end

end

#capybara
#user_attributes
#attributres
#user_created
#user_deleted
#raise_error
#weird_names
