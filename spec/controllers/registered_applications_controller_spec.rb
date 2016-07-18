require 'rails_helper'

RSpec.describe RegisteredApplicationsController, type: :controller do

  let(:my_user) { create(:user) }
  let(:reg_app) { create(:registered_application) }
  let(:my_event) { create(:event, registered_application: reg_app, user: my_user) }

  before do
    sign_in :my_user
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, {id: reg_app.id}
      expect(response).to have_http_status(:success)
    end

    it "renders the #show view" do
      get :show, {id: reg_app.id}
      expect(response).to render_template :show
    end
    it "assigns my_topic to @topic" do
        get :show, {id: reg_app.id}
        expect(assigns(:reg_app)).to eq(reg_app)
      end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it "renders new template" do
      get :new
      expect(response).to render_template(:new)
    end

    it "instantiates registered_application" do
      get :new, registered_application_id: reg_app.id
      expect(assigns(:reg_app)).not_to be_nil
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit, {id: reg_app.id}
      expect(response).to have_http_status(:success)
    end

    it "renders #edit view" do
      get :edit, {id: reg_app.id}
      expect(response).to render_template :edit
    end

    it "assigns bookmark to be updated to @bookmark" do
      get :edit, {id: reg_app.id}
      reg_app_instance = assigns(:reg_app)

      expect(reg_app_instance.id).to eq reg_app.id
    end
  end
  
  describe "DELETE #destroy" do
    it "deletes the bookmark" do
      delete :destroy, id: reg_app.id

      count = RegisteredApplication.where({id: reg_app.id}).size
      expect(count).to eq 0
    end

    it "redirects to my_topic" do
      delete :destroy, id: reg_app.id
      expect(response).to redirect_to root_path
    end
  end
end
