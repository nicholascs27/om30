require 'rails_helper'

RSpec.describe "Municipes", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/municipe/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/municipe/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/municipe/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/municipe/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /update" do
    it "returns http success" do
      get "/municipe/update"
      expect(response).to have_http_status(:success)
    end
  end

end
