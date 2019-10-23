require 'rails_helper'

RSpec.describe TopPagesController, type: :controller do

  describe "GET #home" do
    it "returns http success" do
      get :home
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #about" do
    it "returns http success" do
      get :about
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #service" do
    it "returns http success" do
      get :service
      expect(response).to have_http_status(:success)
    end
  end

end
