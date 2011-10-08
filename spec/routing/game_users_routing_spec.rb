require "spec_helper"

describe GameUsersController do
  describe "routing" do

    it "routes to #index" do
      get("/game_users").should route_to("game_users#index")
    end

    it "routes to #new" do
      get("/game_users/new").should route_to("game_users#new")
    end

    it "routes to #show" do
      get("/game_users/1").should route_to("game_users#show", :id => "1")
    end

    it "routes to #edit" do
      get("/game_users/1/edit").should route_to("game_users#edit", :id => "1")
    end

    it "routes to #create" do
      post("/game_users").should route_to("game_users#create")
    end

    it "routes to #update" do
      put("/game_users/1").should route_to("game_users#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/game_users/1").should route_to("game_users#destroy", :id => "1")
    end

  end
end
