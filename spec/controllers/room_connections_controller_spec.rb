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

describe RoomConnectionsController do

  # This should return the minimal set of attributes required to create a valid
  # RoomConnection. As you add validations to RoomConnection, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
  end

  describe "GET index" do
    it "assigns all room_connections as @room_connections" do
      room_connection = RoomConnection.create! valid_attributes
      get :index
      assigns(:room_connections).should eq([room_connection])
    end
  end

  describe "GET show" do
    it "assigns the requested room_connection as @room_connection" do
      room_connection = RoomConnection.create! valid_attributes
      get :show, :id => room_connection.id.to_s
      assigns(:room_connection).should eq(room_connection)
    end
  end

  describe "GET new" do
    it "assigns a new room_connection as @room_connection" do
      get :new
      assigns(:room_connection).should be_a_new(RoomConnection)
    end
  end

  describe "GET edit" do
    it "assigns the requested room_connection as @room_connection" do
      room_connection = RoomConnection.create! valid_attributes
      get :edit, :id => room_connection.id.to_s
      assigns(:room_connection).should eq(room_connection)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new RoomConnection" do
        expect {
          post :create, :room_connection => valid_attributes
        }.to change(RoomConnection, :count).by(1)
      end

      it "assigns a newly created room_connection as @room_connection" do
        post :create, :room_connection => valid_attributes
        assigns(:room_connection).should be_a(RoomConnection)
        assigns(:room_connection).should be_persisted
      end

      it "redirects to the created room_connection" do
        post :create, :room_connection => valid_attributes
        response.should redirect_to(RoomConnection.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved room_connection as @room_connection" do
        # Trigger the behavior that occurs when invalid params are submitted
        RoomConnection.any_instance.stub(:save).and_return(false)
        post :create, :room_connection => {}
        assigns(:room_connection).should be_a_new(RoomConnection)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        RoomConnection.any_instance.stub(:save).and_return(false)
        post :create, :room_connection => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested room_connection" do
        room_connection = RoomConnection.create! valid_attributes
        # Assuming there are no other room_connections in the database, this
        # specifies that the RoomConnection created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        RoomConnection.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => room_connection.id, :room_connection => {'these' => 'params'}
      end

      it "assigns the requested room_connection as @room_connection" do
        room_connection = RoomConnection.create! valid_attributes
        put :update, :id => room_connection.id, :room_connection => valid_attributes
        assigns(:room_connection).should eq(room_connection)
      end

      it "redirects to the room_connection" do
        room_connection = RoomConnection.create! valid_attributes
        put :update, :id => room_connection.id, :room_connection => valid_attributes
        response.should redirect_to(room_connection)
      end
    end

    describe "with invalid params" do
      it "assigns the room_connection as @room_connection" do
        room_connection = RoomConnection.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        RoomConnection.any_instance.stub(:save).and_return(false)
        put :update, :id => room_connection.id.to_s, :room_connection => {}
        assigns(:room_connection).should eq(room_connection)
      end

      it "re-renders the 'edit' template" do
        room_connection = RoomConnection.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        RoomConnection.any_instance.stub(:save).and_return(false)
        put :update, :id => room_connection.id.to_s, :room_connection => {}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested room_connection" do
      room_connection = RoomConnection.create! valid_attributes
      expect {
        delete :destroy, :id => room_connection.id.to_s
      }.to change(RoomConnection, :count).by(-1)
    end

    it "redirects to the room_connections list" do
      room_connection = RoomConnection.create! valid_attributes
      delete :destroy, :id => room_connection.id.to_s
      response.should redirect_to(room_connections_url)
    end
  end

end
