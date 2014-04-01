require 'spec_helper'

shared_examples("")do
  
end

describe SessionsController do

  describe "sessions#new (GET /login)" do
    before(:each) do
      get :new
    end
    it "has @user for form" do
      expect(assigns(:user)).to be_a_new(User)
    end
    it "redirects to new_session_path" do
      expect(response).to render_template :new 
    end
  end

  describe "sessions#create (POST /login)" do

    context "correct user and pw" do
      before(:each) do
        @user = User.create(name: "crokobit", password: "pw")
        post :create, name: "crokobit", password: "pw"
      end
      it "sets current_user in session[]" do
        expect(session[:user_id]).to eq @user.id
      end

      it "redirects to root_path when authenticating successfully" do
        expect(response).to redirect_to root_path
      end
    end

    context "incorrect user and pw" do
      before(:each) do
        @user = User.create(name: "crokobit", password: "pw")
        post :create, name: "crokobit", password: "wrong pw"
      end
      it "redirects to login path" do
        expect(response).to redirect_to login_path
      end
    end

    context "no user data" do
      before(:each) do
        @user = nil 
        post :create, name: "crokobit", password: "wrong pw"
      end
      it "redirects to login path" do
        expect(response).to redirect_to login_path
      end
    end

  end

  describe "sessions#destroy (DELETE /logout)" do
    before(:each) do
      @user = User.create(name: "crokobit", password: "pw")
      session[:user_id] = @user.id
      delete :destroy, id: @user
    end
    it "clears session[:user_id]" do
      expect(session[:user_id]).to eq nil
    end
    it "redirects to root_path" do
      expect(response).to redirect_to root_path
    end
  end
end
