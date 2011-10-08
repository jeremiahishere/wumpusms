require 'spec_helper'

describe "game_users/edit.html.haml" do
  before(:each) do
    @game_user = assign(:game_user, stub_model(GameUser,
      :game_id => 1,
      :user_id => 1
    ))
  end

  it "renders the edit game_user form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => game_users_path(@game_user), :method => "post" do
      assert_select "input#game_user_game_id", :name => "game_user[game_id]"
      assert_select "input#game_user_user_id", :name => "game_user[user_id]"
    end
  end
end
