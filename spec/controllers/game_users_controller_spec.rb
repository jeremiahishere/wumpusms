require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe GameUsersController do

  # This should return the minimal set of attributes required to create a valid
  # GameUser. As you add validations to GameUser, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
  end

  describe "GET index" do
    it "assigns all game_users as @game_users" do
      game_user = GameUser.create! valid_attributes
      get :index
      assigns(:game_users).should eq([game_user])
    end
  end

  describe "GET show" do
    it "assigns the requested game_user as @game_user" do
      game_user = GameUser.create! valid_attributes
      get :show, :id => game_user.id.to_s
      assigns(:game_user).should eq(game_user)
    end
  end

  describe "GET new" do
    it "assigns a new game_user as @game_user" do
      get :new
      assigns(:game_user).should be_a_new(GameUser)
    end
  end

  describe "GET edit" do
    it "assigns the requested game_user as @game_user" do
      game_user = GameUser.create! valid_attributes
      get :edit, :id => game_user.id.to_s
      assigns(:game_user).should eq(game_user)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new GameUser" do
        expect {
          post :create, :game_user => valid_attributes
        }.to change(GameUser, :count).by(1)
      end

      it "assigns a newly created game_user as @game_user" do
        post :create, :game_user => valid_attributes
        assigns(:game_user).should be_a(GameUser)
        assigns(:game_user).should be_persisted
      end

      it "redirects to the created game_user" do
        post :create, :game_user => valid_attributes
        response.should redirect_to(GameUser.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved game_user as @game_user" do
        # Trigger the behavior that occurs when invalid params are submitted
        GameUser.any_instance.stub(:save).and_return(false)
        post :create, :game_user => {}
        assigns(:game_user).should be_a_new(GameUser)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        GameUser.any_instance.stub(:save).and_return(false)
        post :create, :game_user => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested game_user" do
        game_user = GameUser.create! valid_attributes
        # Assuming there are no other game_users in the database, this
        # specifies that the GameUser created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        GameUser.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => game_user.id, :game_user => {'these' => 'params'}
      end

      it "assigns the requested game_user as @game_user" do
        game_user = GameUser.create! valid_attributes
        put :update, :id => game_user.id, :game_user => valid_attributes
        assigns(:game_user).should eq(game_user)
      end

      it "redirects to the game_user" do
        game_user = GameUser.create! valid_attributes
        put :update, :id => game_user.id, :game_user => valid_attributes
        response.should redirect_to(game_user)
      end
    end

    describe "with invalid params" do
      it "assigns the game_user as @game_user" do
        game_user = GameUser.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        GameUser.any_instance.stub(:save).and_return(false)
        put :update, :id => game_user.id.to_s, :game_user => {}
        assigns(:game_user).should eq(game_user)
      end

      it "re-renders the 'edit' template" do
        game_user = GameUser.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        GameUser.any_instance.stub(:save).and_return(false)
        put :update, :id => game_user.id.to_s, :game_user => {}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested game_user" do
      game_user = GameUser.create! valid_attributes
      expect {
        delete :destroy, :id => game_user.id.to_s
      }.to change(GameUser, :count).by(-1)
    end

    it "redirects to the game_users list" do
      game_user = GameUser.create! valid_attributes
      delete :destroy, :id => game_user.id.to_s
      response.should redirect_to(game_users_url)
    end
  end

end
