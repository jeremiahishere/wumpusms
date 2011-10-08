require "spec_helper"

describe RoomConnectionsController do
  describe "routing" do

    it "routes to #index" do
      get("/room_connections").should route_to("room_connections#index")
    end

    it "routes to #new" do
      get("/room_connections/new").should route_to("room_connections#new")
    end

    it "routes to #show" do
      get("/room_connections/1").should route_to("room_connections#show", :id => "1")
    end

    it "routes to #edit" do
      get("/room_connections/1/edit").should route_to("room_connections#edit", :id => "1")
    end

    it "routes to #create" do
      post("/room_connections").should route_to("room_connections#create")
    end

    it "routes to #update" do
      put("/room_connections/1").should route_to("room_connections#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/room_connections/1").should route_to("room_connections#destroy", :id => "1")
    end

  end
end
