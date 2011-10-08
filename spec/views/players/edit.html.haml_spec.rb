require 'spec_helper'

describe "players/edit.html.haml" do
  before(:each) do
    @player = assign(:player, stub_model(Player,
      :game_id => 1,
      :user_id => 1,
      :room_id => 1,
      :status => "MyString"
    ))
  end

  it "renders the edit player form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => players_path(@player), :method => "post" do
      assert_select "input#player_game_id", :name => "player[game_id]"
      assert_select "input#player_user_id", :name => "player[user_id]"
      assert_select "input#player_room_id", :name => "player[room_id]"
      assert_select "input#player_status", :name => "player[status]"
    end
  end
end
