require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "GET #index" do
    before { get :index }
    it { expect(response).to have_http_status(:success) }
  end

  describe "GET #show" do
    before { get :show }
    it { expect(response).to have_http_status(:success) }
  end


end
