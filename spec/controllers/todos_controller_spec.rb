require 'spec_helper'

describe TodosController do
  
  describe "GET #index" do
    before(:each) do
      @todo1 = Fabricate(:todo)
      @todo2 = Fabricate(:todo)
      get :index
    end
    it "assigns all todos to @todos item" do
      expect(assigns(:todos)).to eq [@todo1,@todo2]
    end
    it "renders the :index template" do
      expect(response).to render_template :index
    end
  end
  
  describe "GET #new" do
    before(:each) do
      get :new
    end
    it "assigns a new created Todo for form_for" do
      expect(assigns(:todo)).to be_a_new(Todo)
    end
    it "renders the :new template " do
      expect(response).to render_template :new
    end
  end

  describe "POST #create" do
    context "valid value" do
      it "saves new todo to db" do
        expect{
          post :create, todo: {do_what: "grammer"}
        }.to change(Todo, :count).by(1)
        expect(Todo.first.do_what).to eq "grammer"
      end
      it "redirects to todos#root_path" do
        post :create, todo: {do_what: "grammer"}
        expect(response).to redirect_to root_path
      end
    end
    context "invalid value"  do
      it "does not save new todo to db" do
        expect{
          post :create, todo: {do_what: ""}
        }.to_not change(Todo, :count)
      end
      it "re-render the :new template" do
        post :create, todo: {do_what: ""}
        expect(response).to render_template :new
      end
    end
  end

  describe "GET #edit" do
    before(:each) do
      @todo_data = Fabricate(:todo)
      get :edit, id: @todo_data
    end
    it "assigns target todo" do
      expect(assigns(:todo)).to eq @todo_data
    end
    it "renders the :edit template " do
      expect(response).to render_template :edit
    end
  end

  describe "PATCH #update" do
    before(:each) do
      @todo = Todo.create(do_what: "grammer")
    end
    context "valid update" do
      before(:each) do
        patch :update, id: @todo, todo: {do_what: "english"}
      end
      it "locates the request object" do
        expect(assigns(:todo).id).to eq 1
      end
      it "update new value to db" do
        expect(assigns(:todo).do_what).to eq "english"
      end
      it "redirect_to root_path" do
        expect(response).to redirect_to root_path
      end
    end
    context "invalid update" do
      before(:each) do
        patch :update, id: @todo, todo: {do_what: ""}
      end
      it "locates the request object" do
        expect(assigns(:todo).id).to eq 1
      end
      it "does not change object's value" do
        expect(assigns(:todo)).to eq @todo
      end
      it "render :edit" do
        expect(response).to render_template :edit
      end
    end
  end

  describe "DELETE #destroy" do
    before(:each) do
      @todo = Fabricate(:todo)
    end
    it "deletes the todo object" do
      expect{
        delete :destroy, id: @todo
      }.to change(Todo, :count).by(-1)
    end
    it "redirects to root_path" do
      delete :destroy, id: @todo
      expect(response).to redirect_to root_path
    end
  end


end
















