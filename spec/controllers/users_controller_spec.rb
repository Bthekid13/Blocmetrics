

  require 'rails_helper'

  RSpec.describe UsersController, type: :controller do


    before do
      @user = create :user
      sign_in(@user)
    end
    describe "GET #show" do
    it "returns http success" do
      get :show, { id: @user.id}
      expect(response).to have_http_status(:success)
    end
    it "renders the show view" do
      get :show, { id: @user.id }
      expect(response).to render_template(:show)
    end

    it "assigns user to @user" do
      get :show, { id: @user.id }
      expect(response).to have_http_status(:success)
      expect(assigns(:user)).to eq @user
    end
  end
end
